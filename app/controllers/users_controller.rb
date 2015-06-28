class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bets = @user.joined_bets
    @rounds = @user.rounds.all.order(created_at: :desc)
    @requested_bets = @user.pending_bets.all.order(created_at: :desc)
  end
end
