class TasksController < ApplicationController

  before_action :find_task_list

  def new
    @task = Task.new
  end

  def create
    @task = @task_list.tasks.new(params.require(:task).permit(:description, :due_date))
    if @task.save
      redirect_to root_path, notice: "Task was created successfully!"
    else
      render :new
    end
  end

  private

  def find_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

end