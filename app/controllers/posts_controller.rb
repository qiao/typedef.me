class PostsController < ApplicationController
  def show
    @commentable = @post = Post.find_by_slug(params[:slug])
  end

  def show_by_tag
    @posts = Post.tagged_with(params[:post_tag]).paginate(
      :page => params[:page],
      :per_page => 5
    )
  end
end
