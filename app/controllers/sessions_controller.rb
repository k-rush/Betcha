class SessionsController < ApplicationController

  def new
    print 'here'
  end 

  def create
    print 'here'
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_url
    end 
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end 


end