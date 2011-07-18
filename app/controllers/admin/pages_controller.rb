class Admin::PagesController < Admin::BaseController
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
  end
end
