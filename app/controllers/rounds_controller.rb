class RoundsController < ApplicationController
  
  def index
    @rounds = Round.all
  end

  def create
    bet = Bet.find(params[:bet_id])
    # example: @membership = current_user.memberships.build(bet_id: params[:bet_id], against: params[:against], accepted: false) #set false to default in migration would be better

    round = bet.rounds.build(params.require(:round).permit(:agree_won))

    if round.save
      redirect_to new_bet_round_contract_path(round_id: round.id)
    end
  
  end

  def update
    # player of round updates round 'accepted' to true
  end

  def destroy
  end
end
