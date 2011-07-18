class PostsController < ApplicationController

  def show
    @post = Post.find_by_slug(params[:slug])
    @comment = @post.comments.new
    @path = [@post, @comment]
  end
end
