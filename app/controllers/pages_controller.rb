class PagesController < ApplicationController
  def home
    @posts = Post.published
  end

  def show
    @page = Page.find(params[:id])
  end
end
