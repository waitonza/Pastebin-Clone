class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected 
			def authenticate_user
				unless session[:user_id]
					redirect_to(:controller => 'web', :action => 'login')
					return false
				else
					# set current user object to @current_user object variable
					@current_user = User.find session[:user_id] 
					return true
				end
			end

			def read_user
				if session[:user_id]
					# set current user object to @current_user object variable
					@current_user = User.find session[:user_id] 
				end
				return true
			end

			def save_login_state
				if session[:user_id]
					redirect_to(:controller => 'web')
					return false
				else
					return true
				end
			end
end
