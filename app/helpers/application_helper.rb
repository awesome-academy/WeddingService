module ApplicationHelper
  include Pagy::Frontend

  def get_services
    @services = Service.all
  end

  def get_vendors
    @vendors = Vendor.all
  end

  def get_schedules
    @schedules = Schedule.where("privacy = 'professed'")
  end

  def my_schedule?
    @schedule = Schedule.find_by id: params[:id]
    return true if current_user.schedule == @schedule
  end
end
