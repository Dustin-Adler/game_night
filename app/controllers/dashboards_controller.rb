class DashboardsController < ApplicationController
    before_action :authenticate_user!

    def index
        
    end

    # def dashboard
    #     redirect_to new_user_session_path
    # end
end
