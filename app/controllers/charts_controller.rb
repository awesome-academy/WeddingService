class ChartsController < ApplicationController
  def schedules_by_privacy
    render json: Schedule.group(:privacy).count
  end

  def schedules_by_created_at
    render json: Schedule.group('date(created_at)').count
  end
end
