class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "You Signed up successfully"
  		flash[:color] = "valid"
      redirect_to(:controller => 'web', :action => 'index')
  	else
  		flash[:notice] = "Form is invalid"
  		flash[:color] = "invalid"
      render "new"
  	end
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username], params[:password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
  		redirect_to(:controller => 'web', :action => 'index')
  	else
  		flash[:notice] = "Invalid Username or Password"
  		flash[:color]= "invalid"
  		redirect_to(:controller => 'web', :action => 'login')
  	end
  end

  def logout
	 session[:user_id] = nil
	 redirect_to :controller => 'web', :action => 'index'
  end

  private
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end

end
