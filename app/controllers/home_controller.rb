class HomeController < ApplicationController
  before_action :signed_in?

  def index; end
end
