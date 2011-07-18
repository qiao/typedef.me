class Admin::PagesController < Admin::BaseController
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
end
