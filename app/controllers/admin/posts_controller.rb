class Admin::PostsController < Admin::BaseController
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  def show
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
      flash.now[:error] = 'Publish failed'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      flash.now[:error] = 'Update failed'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_url
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
end
