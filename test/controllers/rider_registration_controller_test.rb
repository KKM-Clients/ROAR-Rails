require 'test_helper'

class RiderRegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rider_registration_index_url
    assert_response :success
  end

end
