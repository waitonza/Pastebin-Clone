class WebController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def index

  end

  def new
  	
  end

  def logout
	session[:user_id] = nil
	redirect_to :action => 'login'
  end

end
