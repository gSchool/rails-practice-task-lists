class CommentsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.task = @task
    @comment.user = current_user
    @comment.save
    redirect_to root_path

  end

end