require 'test_helper'

class SubprojectTest < ActiveSupport::TestCase

  def setup
    @subproject = Subproject.new(name: "Generic Sub", description: "Describe me")
    @subscount = Subproject.all.count + 1
  end
   test "subproject is valid" do
     assert @subproject.valid?
   end

   test "subproject must have a name" do
     @subproject.name = " "
     assert_not @subproject.valid?
   end

   test "subproject name must be longer 2" do
     @subproject.name = "a" * 2
     assert @subproject.valid?
   end


  test "subrojecct does not need a description" do
    @subproject.description = " "
    assert @subproject.valid?
  end

  test "subproject is added" do
    assert_difference 'Subproject.count', 1 do
      @subproject.save
    end
  end
end
