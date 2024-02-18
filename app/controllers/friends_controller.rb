class FriendsController < ApplicationController
  before_action :set_friend, only: %i[show destroy]

  def show; end

  def create
    new_friend = User.find_by(username: friend_params[:friend_2_id]) # verifies that the username entered belongs to another user in the system before creating new friend row.

    if new_friend && (new_friend != current_user) # makes sure that the user isn't trying to friend themselves, and formats data for creating new friend row.
      @friend = Friend.new(friend_1_id: current_user.id, friend_2_id: new_friend.id)
    else
      @friend = Friend.new(friend_1_id: current_user.id)
    end

    if @friend.save
      redirect_to dashboards_path, notice: 'Friend was successfully created.'
    else
      redirect_to dashboards_path, alert: @friend.errors.full_messages.first
    end
  end

  def destroy
    if @friend.destroy
      redirect_to dashboards_path, notice: 'Friend was successfully deleted.'
    else
      redirect_to dashboards_path, alert: @friend.errors.full_messages
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:friend_2_id)
  end
end
