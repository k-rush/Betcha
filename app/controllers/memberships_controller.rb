class MembershipsController < ApplicationController

  def index
    @bet = Bet.find(params[:bet_id])
    @memberships = Membership.all
  end
  
  def show
    @membership = Membership.find(params[:id])
    @bet = @membership.bet
    @member = @membership.user
  end

  def create
    @bet = Bet.find(params[:bet_id])
    @membership = current_user.memberships.build(bet_id: params[:bet_id], against: params[:against], accepted: false) #set false to default in migration would be better
    #bet_id: params[:bet_id], against: params[:membership][:against], accepted: :false)
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
    @membership.update(accepted: true)
    @user = @membership.user
    @bet = @membership.bet

    if @membership.save
      flash[:success] = "#{@user.name} joined the bet!"
      redirect_to @bet
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to :back
  end

end
