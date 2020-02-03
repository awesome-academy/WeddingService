class SchedulesController < ApplicationController
  before_action :get_schedule, only: %i(show)

  def show
    @tasks = @schedule.tasks
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def index
    @pagy, @schedules = pagy Schedule.all, items: 4
  end

  private
  def get_schedule
    @schedule = Schedule.find_by id: params[:id]
  end
end
