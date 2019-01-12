require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @travis = users :travis
    @project = projects :projectOne
    @task = Task.new(comments: "Basic task", project_id: @project.id, subproject_id: 2,
                      day: "2019-01-09", time: 55, user_ids: [@travis.id])
  end



   test "task is valid" do
     assert @task.valid?
   end

   test "task saves" do
     assert_difference 'Task.count', 1 do
       @task.save
     end
   end

   test "task has project" do
     @task.project_id = nil
     assert_not @task.save
   end


# Some debate is warrented based on if the task should save with or
# without a sub_project.
#   test "task has subproject" do
#     @task.subproject_id = nil
#     assert_not @task.save
#   end

  test "task associates with users" do
    assert_difference 'UserTask.count', 1 do
      @task.save
    end
  end

  test "task saves to multiple users" do
    @task.user_ids = [1, 2]
    assert_difference 'UserTask.count', 2 do
      @task.save
    end
  end

end
