class PostsController < ApplicationController
  def show
    @commentable = @post = Post.find_by_slug(params[:slug])
  end

  def index_by_tag
    @posts = Post.tagged_with(params[:post_tag]).paginate(
      :page => params[:page],
      :per_page => 5
    )
  end

  def feed
    @posts = Post.published
    @title = 'typedef.me'
    @updated = @posts.first.created_at unless @posts.empty?

    respond_to do |format|
      format.atom { render :layout => false }
    end
  end
end
