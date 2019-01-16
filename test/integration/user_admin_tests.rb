require 'test_helper'

class UserAdminTest < ActionDispatch::IntegrationTest
    def setup
      @travis = users :travis
     login_as(@travis, :scope => :user)

    end

    test "user has admin privilidges" do
      visit tasks_path
      assert page.has_content?("Admin")
    end
    
end
