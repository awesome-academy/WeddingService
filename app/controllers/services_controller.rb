class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :get_service, only: %i( show edit update)
  def index
    @pagy, @services = pagy Service.all, items: 4
  end

  def show
    @pagy, @service_of_vendors = pagy @service.serviceOfVendors, items: 4
  end

  def def new
    @service = Service.new
  end

  def create
    @service = Service.new service_params
    if @service.save
      redirect_to @service
    else
      redirect_to services_path
    end
  end

  def edit; end

  def update
    if @service.update service_params
      redirect_to @service
    else
      flash[:danger] = t "views.services.fail"
      redirect_to services_path
    end
  end

  private
  def service_params
    params.require(:service).permit :name, :describle
  end

  def get_service
    @service =  Service.find_by id: params[:id]
    return if @service
    redirect_to services_path
  end
end
