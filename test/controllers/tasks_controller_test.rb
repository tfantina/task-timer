require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @travis =  users :travis
    @task = Task.new(user_id: users(:travis).id, comments: "Hello")
    sign_in_as @travis
  end


  test "logged in user sees home page" do
     assert true
   end


   test "user can add task" do
     assert_select 'button'

     assert @task.save
   end
end
