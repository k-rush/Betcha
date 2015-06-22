class BetsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
	
  def index
    if current_user.active_bets.any?
		  @bets = current_user.active_bets.all # !!! check syntax and logic
    else
      @bets = []
    end
  end

  def show
    @bet = Bet.find(params[:id])
    @agree_members = @bet.agree_members.all
    @against_members = @bet.against_members.all
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
    	params.require(:bet).permit(:title, :bet, :wager, :odds) #removed user_id, will be created using current_user.bets.build
    end

end

