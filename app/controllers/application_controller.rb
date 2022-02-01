class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :signed_in?

  def signed_in?
    redirect_to dashboards_path if current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
      keys: [:username, :email, :password, :password_confirmation, :time_zone])
    devise_parameter_sanitizer.permit(:sign_up, 
      keys: [:login, :password, :password_confirmation, :time_zone])
    devise_parameter_sanitizer.permit(:account_update, 
      keys: [:username, :email, :current_password, :password_confirmation])
  end

end
