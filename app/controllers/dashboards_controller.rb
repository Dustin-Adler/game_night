class DashboardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @friend = Friend.new
        @friends = Friend.get_friends(current_user)
    end

end
