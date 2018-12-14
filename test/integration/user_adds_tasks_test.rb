require 'test_helper'

class UserAddsTasksTest < ActionDispatch::IntegrationTest
    def setup
      @task1 = tasks :one
      @task2 = tasks :two
      @travis = users :travis
      @newTask = Task.new(user_id: @travis.id, comments: "New Task")

     login_as(@travis, :scope => :user)

    end

    test "user can add a task" do
        visit tasks_path
        click_on "Add Task"
        fill_in "task[comments]", with: "Sample Task"
        click_button "Insert"

        assert page.has_content? "Simple Task"


    end
end
