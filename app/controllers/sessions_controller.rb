class SessionsController < ApplicationController
  layout 'login'

  def new
  end

  def create
    if params[:session][:password] == APP_CONFIG['password'] then
      session[:logged_in] = true
      redirect_to admin_url
    else
      flash[:error] = 'Wrong password'
      redirect_to login_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
