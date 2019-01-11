require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @travis = users :travis

    @task = Task.new(comments: "Basic task", project_id: 1, subproject_id: 2,
                      day: "2019-01-09", time: 55, user_ids: [@travis.id])
  end



   test "task can save" do
     assert @task.save "task should save"
   end
end
