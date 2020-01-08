class TasksController < ApplicationController
  before_action :get_task, only: %i(destroy)
  before_action :get_schedule, only: %i(destroy)

  def destroy
    if @task.destroy
      flash[:success] = t "views.tasks.success"
      redirect_to @schedule
    else
      flash[:danger] = t "views.tasks.fail"
      redirect_to @schedule
    end
  end

  private
  def get_task
    @task = Task.find_by id: params[:id]
  end

  def get_schedule
    @task = Task.find_by id: params[:id]
    @schedule = @task.schedule
    return if @schedule
    redirect_to schedules_path
  end
end
