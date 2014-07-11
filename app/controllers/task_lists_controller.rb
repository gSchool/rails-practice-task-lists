class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

end