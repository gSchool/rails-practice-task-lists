class TaskListsController < ApplicationController

  def index
    if params[:task]
      @assigned_to = params[:task][:assigned_to]
    end

    @task_lists = TaskList.order(:name)
  end

end