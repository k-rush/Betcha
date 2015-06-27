class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bets = @user.joined_bets
    @rounds = @user.rounds.all
  end
end
