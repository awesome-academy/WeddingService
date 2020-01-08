class TasksController < ApplicationController
  before_action :get_task, only: %i(destroy edit update)
  before_action :get_schedule, only: %i(destroy)

  def edit; end

  def index 
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def update
    if @task.update time_params
      flash[:success] = t "views.tasks.success"
        redirect_to @task.schedule
    else
      flash[:danger] = t "views.tasks.fail"
      redirect_to @task.schedule
    end
  end

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

  def time_params
    params.require(:task).permit :time
  end
end
