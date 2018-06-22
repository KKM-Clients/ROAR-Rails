#Load gem
require 'square_connect'
require 'securerandom'

# Setup authorization
SquareConnect.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = ENV["SQUARE_ACCESS_TOKEN"]
  config.location_id = ENV["SQUARE_LOCATION_ID"]
  cofig.application_id = ENV["SQUARE_APPLICATION_ID"]
end
