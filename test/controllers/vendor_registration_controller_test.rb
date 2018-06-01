require 'test_helper'

class VendorRegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendor_registration_index_url
    assert_response :success
  end

end
