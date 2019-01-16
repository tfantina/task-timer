require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "admin user can login" do
     get admin_index_path
     assert_response :success
  end
end
