class Admin::DashboardController < Admin::BaseController
  def index
    @posts = Post.published
  end
end
