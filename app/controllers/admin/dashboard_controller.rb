class Admin::DashboardController < Admin::BaseController
  def show
    @posts = Post.all
  end
end
