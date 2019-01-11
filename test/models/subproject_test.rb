require 'test_helper'

class SubprojectTest < ActiveSupport::TestCase

  def setup
    @subproject = Subproject.new(name: "Generic Sub", description: "Describe me")
  end
   test "subproject saves" do
     assert @subproject.valid?
   end

   test "subproject must have a name" do
     @subproject.name = " "
     assert_not @subproject.valid?
   end

   test "subproject name must be longer 2" do
     @subproject.name = "a" * 2
     assert @subproject.valid
   end
end
