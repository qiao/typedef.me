class Admin::PagesController < Admin::BaseController
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]

  def show
    @comment = @page.comments.new
    @path = [@page, @comment]
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to @page
    else
      flash.now[:error] = 'Update failed'
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_url
  end

  private
  def find_page
    @page = Page.find(params[:id])
  end
end
