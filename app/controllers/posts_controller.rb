class PostsController < ApplicationController

  def show
    @commentable = @post = Post.find_by_slug(params[:slug])
  end
end
