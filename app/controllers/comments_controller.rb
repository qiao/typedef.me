class CommentsController < ApplicationController
  before_filter :find_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_agent = request.user_agent

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable, 
                      :notice => 'Thanks for your comment' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @commentable,
                      :alert => 'Unable to add comment' }
        format.js
      end
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
