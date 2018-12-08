require 'test_helper'


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

  test "user can logout" do
    visit(tasks_path)
    click_on "Log out"
    assert_current_path root_url
  end
end
