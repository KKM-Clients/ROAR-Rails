require_relative 'boot'

require 'rails/all'

# Load the gem
#require 'square_connect'
require 'securerandom'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ROARR5
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Setup authorization
    SquareConnect.configure do |config|
      # Configure OAuth2 access token for authorization: oauth2
      config.access_token = ENV["SQUARE_ACCESS_TOKEN"]
    end
  end
end
