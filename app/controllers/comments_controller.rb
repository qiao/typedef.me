class CommentsController < ApplicationController
  before_filter :find_commentable

  def new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_agent = request.user_agent
    flash.now[:error] = @comment.errors.full_messages unless @comment.save
    redirect_to commentable_url(@commentable)
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
