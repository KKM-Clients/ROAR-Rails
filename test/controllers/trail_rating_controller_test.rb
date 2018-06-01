require 'test_helper'

class TrailRatingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trail_rating_index_url
    assert_response :success
  end

end
