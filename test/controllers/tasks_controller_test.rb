require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @travis =  users :travis
    @task = Task.new(comments: "Basic task", project_id: 1, subproject_id: 2,
                      day: "2019-01-09", time: 55, user_ids: [@travis.id])
    sign_in_as @travis
  end


  test "logged in user sees home page" do
     assert true
   end


   test "user can add task" do
     get tasks_path
     assert page.has_content? 'New Task'
     click_button 'New Task'
     assert true
   end

end
