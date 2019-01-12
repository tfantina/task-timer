require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @subproject = user_tasks :sub_one
    @project = Project.new(name: "Project", summary: "basic project", start: "5-6-2018",

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
   test "the truth" do
     assert true
   end
end
