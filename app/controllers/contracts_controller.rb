class ContractsController < ApplicationController
  def index
  end

  def new
    @round = Round.find(params[:round_id])
    @bet = @round.bet
    @agree_players = @bet.agree_members
    @against_players = @bet.against_members
  end

  def create
    @round = Round.find(params[:round_id])
    @contract = @round.contracts.build(params.require(:contract).permit(:user_id))
    
    if @contract.save
      redirect_to :back
    end
  end


  def update
  end

  def destroy
  end
end
