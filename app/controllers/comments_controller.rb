class CommentsController < ApplicationController
  before_filter :find_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_agent = request.user_agent
    flash.now[:error] = @comment.errors.full_messages unless @comment.save
    if @type == :page
      redirect_to page_url(@commentable)
    else
      redirect_to post_url(@commentable)
    end
  end
  
  private
  def find_commentable
    @type = params[:post_id].nil? ? :page : :post
    if @type == :page
      @commentable = Page.find(params[:page_id])
    else
      @commentable = Post.find(params[:post_id])
    end
  end
end
