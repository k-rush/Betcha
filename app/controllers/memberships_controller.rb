class MembershipsController < ApplicationController

  def index
    @bet = Bet.find(params[:bet_id])
    @memberships = @bet.memberships
  end
  
  def show
    @membership = Membership.find(params[:id])
    @bet = @membership.bet
    @member = @membership.user
  end

  def create
    @membership = current_user.memberships.build(bet_id: params[:bet_id], accepted: false, against: false)
    if @membership.save
      redirect_to :back
      #SUCCESS MESSAGE
    else
      redirect_to :back
      #FAIL MESSAGE
    end
  end

  def update
    @membership = Membership.find(params[:id])
    @bet= @membership.bet
    @user = @membership.user
    if @membership.update_attributes(params.require(:membership).permit(:accepted))
      flash[:success] = "#{@user.email} joined"
      redirect_to @bet
    end
  end

  def destroy
  end

end
