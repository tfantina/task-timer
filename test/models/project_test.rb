require 'test_helper'
include FactoryBot::Syntax::Methods

class ProjectTest < ActiveSupport::TestCase

  def setup
    @subproject = build(:subproject)
    @project = Project.new(name: "Project", summary: "basic project", start: "5-6-2018")
  end

   test "project is valid" do
     assert @project.valid?
   end

   test "project must have a name" do
     @project.name = " "
     assert_not @project.valid?
   end

   test "project name must be longer 3" do
     @project.name = "a" * 3
     assert @project.valid?
   end


  test "projecct does not need a summary" do
    @project.summary = " "
    assert @project.valid?
  end

  test "project saves" do
    assert_difference 'Project.count', 1 do
      @project.save
    end
  end

  test "project associates with subprojects" do
      @subproject.save
      @project.subproject_ids = [@subproject.id]
     assert_difference 'ProjectAssocaition.count', 1 do
       @project.save
     end
   end

end
