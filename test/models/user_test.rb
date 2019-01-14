require 'test_helper'
include FactoryBot::Syntax::Methods

class UserTest < ActiveSupport::TestCase
  def setup
    @usr = build(:user)
  end
   test "user is valid" do
     assert @usr.valid?
   end

   test "user saves" do
     assert_difference 'User.count', 1 do
       @usr.save
     end

   end


end
