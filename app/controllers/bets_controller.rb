class BetsController < ApplicationController
  before_action :require_user, only:[:index, :show, :new, :create]
	def feed
		@bet = Bet.all
	end
  
  def new
    @bet = Bet.new
  end
  
  def create 
  	@bet = Bet.new(bet_params) 
  	if @bet.save 
    	redirect_to '/bets' 
 	 	else 
    	render 'new' 
  		end 
	end
  
	private 
  	def bet_params 
    	params.require(:bet).permit(:title, :bet, :wager, :odds, :user_id)
    end

end

