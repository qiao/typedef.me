class Admin::DashboardController < Admin::BaseController
  def show
    @posts = Post.all
    @pages = Page.all
  end
end
