ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'minitest/rails/capybara'

Minitest::Reporters.use!

include Capybara::DSL
include Warden::Test::Helpers

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
   config.include Capybara::DSL

  def sign_in_as(user)
    post user_session_path, params: {email: user.email,
                                     password: user.password}
  end

  

end
