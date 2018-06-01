require 'test_helper'

class LodgingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lodging_index_url
    assert_response :success
  end

end
