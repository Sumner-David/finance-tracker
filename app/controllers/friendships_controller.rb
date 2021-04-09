class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)

    if current_user.save
      flash[:notice] = "Following User"
    else
      flash[:alert] = "There was an issue saving friends"
    end

    redirect_to friends_path
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship.destroy
    flash[:notice] = "Stoped Following"
    redirect_to friends_path
  end
end