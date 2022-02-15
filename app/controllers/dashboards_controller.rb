class DashboardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @current_user = current_user
        @friend = Friend.new
        @friends = Friend.get_friends(current_user)
        @group = Group.new
        @groups = Group.users_groups(current_user)
        @events = current_user.events
    end

end
