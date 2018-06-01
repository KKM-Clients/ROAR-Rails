require 'test_helper'

class RulesRegsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rules_regs_index_url
    assert_response :success
  end

end
