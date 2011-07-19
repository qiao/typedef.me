class PagesController < ApplicationController
  def home
    @posts = Post.published
  end

  def show
    @page = Page.find_by_slug(params[:slug])
    @comment = @page.comments.new
    @path = [@page, @comment]
  end
end
