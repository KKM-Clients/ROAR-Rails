require 'test_helper'

class RulesRegsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rules_regs_index_url
    assert_response :success
  end

  test "should get create" do
    get rules_regs_create_url
    assert_response :success
  end

  test "should get new" do
    get rules_regs_new_url
    assert_response :success
  end

  test "should get show" do
    get rules_regs_show_url
    assert_response :success
  end

end
