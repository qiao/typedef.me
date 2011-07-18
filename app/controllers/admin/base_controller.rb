class Admin::BaseController < ApplicationController
  layout 'dashboard'

  before_filter :authenticate

  def authenticate
    redirect_to '/login' unless session[:logged_in]
  end
end
