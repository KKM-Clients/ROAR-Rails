require 'test_helper'

class LodgingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lodging_index_url
    assert_response :success
  end

  test "should get create" do
    get lodging_create_url
    assert_response :success
  end

  test "should get new" do
    get lodging_new_url
    assert_response :success
  end

  test "should get show" do
    get lodging_show_url
    assert_response :success
  end

end
