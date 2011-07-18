class Admin::PostsController < Admin::BaseController

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @path = [@post, @comment]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

end
