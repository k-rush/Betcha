class BetsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
	
  def index
		  @active_bets = current_user.active_bets # !!! check syntax and logic
      @pending_bets = current_user.pending_bets
      @all_bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])

    @current_relationship = current_user.memberships.find_by(bet_id: @bet)
    
    @agree_members = @bet.agree_members.all
    @against_members = @bet.against_members.all
    
    @agree_requesters = @bet.agree_requesters.all
    @against_requesters = @bet.against_requesters.all
  end
  
  def new
    @bet = Bet.new
  end
  
  def create 
  	@bet = Bet.new(bet_params)
  	if @bet.save
      redirect_to @bet
 	 	else 
    	render 'new' 
  	end 
	end
  
	private 
  	def bet_params 
    	params.require(:bet).permit(:title, :bet, :wager, :odds) #removed user_id, will be created using current_user.bets.build
    end

end

