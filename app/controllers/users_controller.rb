class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bets = @user.entered_bets
  end
end
