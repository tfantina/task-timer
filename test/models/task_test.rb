require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new(user_id: users(:travis).id, comments: "Hello")
  end
   test "task can save" do

     assert @task.save
   end
end
