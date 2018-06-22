require 'test_helper'

class PassengersControllerTest < ActionDispatch::IntegrationTest
  test "should get fname:string" do
    get passengers_fname:string_url
    assert_response :success
  end

  test "should get lname:string" do
    get passengers_lname:string_url
    assert_response :success
  end

  test "should get age:int" do
    get passengers_age:int_url
    assert_response :success
  end

  test "should get tshirt:string" do
    get passengers_tshirt:string_url
    assert_response :success
  end

  test "should get d_id:int" do
    get passengers_d_id:int_url
    assert_response :success
  end

end
