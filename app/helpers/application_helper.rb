module ApplicationHelper
  def title
    'Typedef.me'
  end

  def logged_in?
    session[:logged_in]
  end
end
