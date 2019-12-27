module ApplicationHelper
  include Pagy::Frontend

  def get_services
    @services = Service.all
  end

  def get_vendors
    @vendors = Vendor.all
  end
end
