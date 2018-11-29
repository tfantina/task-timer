require 'test_helper'
include Capybara::DSL
include Warden::Test::Helpers

class UserSigninTest < ActionDispatch::IntegrationTest

  def setup
    @user = users :travis
  end

  test "user can login" do
    visit('/users/sign_in')
    login_as(@user, :scope => :user)
    click_on "Log in"
    assert_current_path tasks_path
    assert page.has_content?("Welcome Travis")
  end
end
