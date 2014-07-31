class TasksController < ApplicationController

  before_action :find_task_list

  def new
    @task = Task.new
  end

  def index
    @task = Task.where(Task.assigned_to: = params[:assigned_to])
    p params
  end

  def create
    @task = @task_list.tasks.new(params.require(:task).permit(:description, :due_date, :assigned_to))
    if @task.save
      redirect_to root_path, notice: "Task was created successfully!"
    else
      render :new
    end
  end

  def update
    @task = @task_list.tasks.find(params[:id])
    @task.update_attributes(completed: true)
    redirect_to root_path, notice: "Task was completed successfully!"
  end

  private

  def find_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

end