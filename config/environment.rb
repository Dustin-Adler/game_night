# Load the Rails application.
require_relative "application"

Rails.application.configure do
    require 'ipinfo-rails'
    config.middleware.use(IPinfoMiddleware, {token: Rails.application.credentials.ipinfo_token})
end

# Initialize the Rails application.
Rails.application.initialize!

