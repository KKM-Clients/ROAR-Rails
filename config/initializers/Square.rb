# Load the gem
require 'square_connect'

# Setup authorization
SquareConnect.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'sandbox-sq0atb-h6g3t46c-Iymqs0X3PRwJQ'
end

# The SDK throws an exception if a Connect endpoint responds with anything besides 200 (success).
# This block catches any exceptions that occur from the request.
locations_api = SquareConnect::LocationsApi.new

begin
  locations = locations_api.list_locations.locations
rescue SquareConnect::ApiError => e
  puts "Error encountered while loading the locations: #{e.message}"
end
