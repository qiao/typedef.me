class Admin::BaseController < ApplicationController
  layout 'dashboard'

  before_filter :authenticate

  def authenticate
    redirect_to login_url unless session[:logged_in]
  end
end
