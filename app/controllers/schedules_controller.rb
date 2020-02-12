class SchedulesController < ApplicationController
  before_action :get_schedule, only: %i(show edit update)

  def new; end
  
  def edit; end

  def update
    if @schedule.update schedule_params
      redirect_to @schedule
    else
      redirect_to @schedule
    end 
  end
  
  def show
    @tasks = @schedule.tasks
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def index
    @pagy, @schedules = pagy Schedule.professed, items: 4
  end

  private
  def get_schedule
    @schedule = Schedule.find_by id: params[:id]
  end

  def schedule_params
    params.require(:schedule).permit :privacy
  end
end
