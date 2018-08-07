require 'test_helper'

class SquareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get square_index_url
    assert_response :success
  end

end
