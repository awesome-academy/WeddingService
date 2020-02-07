class ClonesController < ApplicationController
  def create
    @schedule = Schedule.find_by id: params[:schedule_id]
    if @schedule
      @schedule_dup = @schedule.amoeba_dup
      @schedule_dup.save
      current_user.schedule = @schedule_dup
      current_user.save
      redirect_to schedule_path(@schedule_dup)
    else
      redirect_to schedule_path(@schedule)
    end
  end
end
