class PagesController < ApplicationController
  def home
    @posts = Post.published
  end
end
