class PagesController < ApplicationController
  def home
    @posts = Post.published.paginate(:page => params[:page],
                                     :per_page => 5)
  end

  def show
    @page = Page.find_by_slug(params[:slug])
    unless @page
      redirect_to '/404'
    end
    @title = @page.title
  end
end
