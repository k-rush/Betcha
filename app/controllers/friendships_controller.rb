class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
  end

  def create
    #to stop current friends from saving
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], accepted: false)
  
    if @friendship.save
      flash[:notice] = "Friend request sent!"
      redirect_to :back
    else
      flash[:error] = "Unable to send friend request"
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    @friendship.update(accepted: true)
    
    if @friendship.save
      redirect_to :back, notice: "Successfully added new friend!"
    else
      redirect_to root_url, notice: "Something went wrong, friend not added"
    end

  end

  def destroy
    @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = "Removed friendship"
    redirect_to :back
  end

end