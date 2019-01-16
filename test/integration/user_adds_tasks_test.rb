require 'test_helper'

class UserAddsTasksTest < ActionDispatch::IntegrationTest
    def setup
      @task1 = tasks :tskone
      @task2 = tasks :tsktwo
      @travis = users :travis
      @project = projects :projectOne
      @newtask = Task.new(comments: "Basic task", project_id: @project.id, subproject_id: 2,
                        day: "2019-01-09", time: 55, user_ids: [@travis.id])

     login_as(@travis, :scope => :user)

    end

    test "user can add a task" do
        visit tasks_path
        click_on "New Task"
        fill_in "task[comments]", with: "Sample Task"
        click_button "Add Task"

        assert page.has_content? "Simple Task"


    end
end
