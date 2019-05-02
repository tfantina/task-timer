class AdminController < ApplicationController
  def index
      @users = User.order(name: :asc).all
  end

  def user_projects
    @tasks = Task.where(user_id: id)
  end
end
