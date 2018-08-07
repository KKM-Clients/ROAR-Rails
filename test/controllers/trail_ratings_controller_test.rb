require 'test_helper'

class TrailRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trail_ratings_index_url
    assert_response :success
  end

  test "should get create" do
    get trail_ratings_create_url
    assert_response :success
  end

  test "should get new" do
    get trail_ratings_new_url
    assert_response :success
  end

  test "should get show" do
    get trail_ratings_show_url
    assert_response :success
  end

end
