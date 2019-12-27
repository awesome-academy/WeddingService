class ServiceOfVendorsController < ApplicationController
  def index 
    @pagy, @service_of_vendors = pagy ServiceOfVendor.all, items: 4
  end

  def show 
    @service_of_vendor = ServiceOfVendor.find_by id: params[:id]
  end

  private
  def service_of_vendor_params
    params.require(:service_of_vendor).permit :describle, :service_id
  end
end
