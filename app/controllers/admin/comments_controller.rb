class CommentsController < ApplicationController
  before_filter :find_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable
    else
      flash.now[:error] = @comment.errors.full_messages
    end
  end
  
  private
  def find_commentable
    if params[:post_id].nil?
      @commentable = Page.find(params[:page_id])
    else
      @commentable = Post.find(params[:post_id])
    end
  end
end
