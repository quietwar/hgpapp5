class FriendshipsController < ApplicationController

  def index
    @friends = Friend.all
  end

  def show
    @friends = Friend.find(params[:id])
    @friend = Friendship.find(params[:friend_id])
    @projects = @friend.projects
  end

  def create
    @friend = User.find(params[:friend_id])
    params[:user_id] = current_user.id

    Friendship.create(friendship_params) unless current_user.follows_or_same?(friend)
    redirect_to root_path
  end

  def destroy
    @friendship = Friendship.find(params[:friend_id])
    friendname = @friendship.friend.full_name

    if @friendship.destroy
      flash[:notice] = "#{friendname} unfollowed."
    else
      flash.now[:alert] = "#{friendname} could not be unfollowed."
    end
    redirect_to projects_path(current_user)
  end

  private

  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end
