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
  	else
  		flash[:notice] = "Form is invalid"
  		flash[:color] = "invalid"
  	end
  	render "new"
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
	if authorized_user
		session[:user_id] = authorized_user.id
		flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
		redirect_to(:action => 'home')
	else
		flash[:notice] = "Invalid Username or Password"
		flash[:color]= "invalid"
		render "login"	
	end
  end

  def logout
	 session[:user_id] = nil
	 redirect_to :action => 'login'
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
