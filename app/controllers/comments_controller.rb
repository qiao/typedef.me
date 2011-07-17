class CommentsController < ApplicationController
  before_filter :find_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to @commentable
    end
  end
  
  private
  def find_commentable
    @commentable = Commentable.find(params[:id])
  end
end
