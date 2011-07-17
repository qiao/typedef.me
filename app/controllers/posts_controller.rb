class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @path = [@post, @comment]
  end
end
