class VendorsController < ApplicationController
  before_action :get_vendor, only: %i(edit show destroy update)
  load_and_authorize_resource param_method: :vendor_params
  load_and_authorize_resource find_by: :slug
  def index
    @pagy, @vendors = pagy Vendor.all, items: 4
  end

  def new
    @vendor = current_user.vendors.build
  end
  
  def create
    @vendor = current_user.vendors.build vendor_params
    if @vendor.save
      redirect_to @vendor
    else
      redirect_to current_user
    end
  end

  def show 
    @pagy, @service_of_vendors = pagy @vendor.serviceOfVendors, items: 2
  end

  def edit; end

  def update
    if @vendor.update vendor_params
      flash[:success] = t("views.vendors.success")
    else
      flash[:success] = t("views.vendors.fail")
    end
      redirect_to @vendor
  end

  def destroy
    if @vendor.destroy
      flash[:success] = t("views.vendors.success")
      redirect_to vendor_path
    else
      redirect_to vendors_path
    end
  end

  private
  def vendor_params
    params.require(:vendor).permit :name, :phone, :place, :email, :introduction
  end

  def get_vendor
    @vendor =  Vendor.find_by_slug(params[:id]) || Vendor.find_by(id: params[:id])
    return if @vendor
    redirect_to vendors_path
  end
end
