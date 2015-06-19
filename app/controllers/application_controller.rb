class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :get_user_email, :is_current_user
  
  def current_user
    @current_user ||=
      User.find(session[:user_id]) if session[:user_id]
  end

  def require_user 
  	redirect_to '/login' unless current_user 
	end

  def get_user_email (user_id)
    @get_user_email ||= User.find(user_id).email
  end

  def is_current_user(user_id)
    @is_current_user ||= current_user == User.find(user_id)
  end




end
