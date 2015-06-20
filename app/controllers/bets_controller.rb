class BetsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create]
	def index
		@bets = Bet.all #changed from @bet
	end
  
  def new
    @bet = current_user.bets.build
  end
  
  def create 
  	@bet = current_user.bets.build(bet_params) # changed form Bet.new
  	if @bet.save 
    	redirect_to '/bets' 
 	 	else 
    	render 'new' 
  		end 
	end
  
	private 
  	def bet_params 
    	params.require(:bet).permit(:title, :bet, :wager, :odds) #removed user_id, will be created using current_user.bets.build
    end

end

