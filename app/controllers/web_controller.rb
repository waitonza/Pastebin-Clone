class WebController < ApplicationController
  before_filter :authenticate_user, :only => [:profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  before_filter :read_user
  def index
    @posts = Post.all
  end

  def new
    if !params[:post]
      @post = Post.new
    else 
      @post = params[:post]
    end
  end

  def logout
	   session[:user_id] = nil
	   redirect_to :action => 'login'
  end

end
