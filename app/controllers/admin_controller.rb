class AdminController < ApplicationController
  def index
      @users = User.order(name: :asc).all
  end

  def user_tasks
    @current_usr_task = UserTask.where(user_id: params[:id])
    @tasks = Task.where(id: @current_usr_task.ids)
    @projects = Project.all.order(name: :asc)
  end

end
