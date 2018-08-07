require 'test_helper'

class RidersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get riders_index_url
    assert_response :success
  end

  test "should get create" do
    get riders_create_url
    assert_response :success
  end

  test "should get new" do
    get riders_new_url
    assert_response :success
  end

  test "should get show" do
    get riders_show_url
    assert_response :success
  end

end
