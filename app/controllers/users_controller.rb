class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bets = @user.entered_bets
  end
end
