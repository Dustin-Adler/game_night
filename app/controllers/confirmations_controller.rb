class ConfirmationsController < Devise::ConfirmationsController
  private

    def after_confirmation_path_for(_resource_name, resource)
      sign_in(resource)
      dashboards_path
    end
end
