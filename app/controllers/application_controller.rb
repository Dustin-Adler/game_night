class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :signed_in?, :set_time_zone

  def signed_in?
    redirect_to dashboards_path if current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username email password password_confirmation time_zone])
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[login password password_confirmation time_zone])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username email current_password password_confirmation])
  end

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
