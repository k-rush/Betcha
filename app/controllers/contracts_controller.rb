class ContractsController < ApplicationController
  def index
  end

  def new
    @round = Round.find(params[:round_id])
    @bet = @round.bet

    @current_membership = current_user.memberships.find_by(bet_id: @bet)
    
    @agree_members = @bet.agree_members.all
    @against_members = @bet.against_members.all
    
    @agree_requesters = @bet.agree_requesters.all
    @against_requesters = @bet.against_requesters.all

    @rounds = @bet.rounds.all.order(created_at: :desc)  # paginate this
    
    @agree_players = @bet.agree_members
    @agree_players.each do |player| 
      @round.contracts.create!(user_id: player.id) # not sure if this is good practice, but it finally WORKS!!! :D   Auto forges contracts, which still need to be signed
    end

    @against_players = @bet.against_members # dry this up, move logic to model
    @against_players.each do |player|
      @round.contracts.create!(user_id: player.id)
   
    end
     
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
