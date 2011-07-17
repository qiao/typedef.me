class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:session][:password] == '123456' then
      session[:logged_in] = true
    raise Exception.new(params)
      redirect_to admin_path
    else
      flash[:error] = 'Wrong password'
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
