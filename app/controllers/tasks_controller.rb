class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
  end

  def show
      @tasks = Task.where(user_id: current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      @tasks = Task.where(user_id: current_user.id)
      flash[:success] = "Task added"
      respond_to do |format|
          format.js
         end

    else
      flash[:error] = "Task not added"
      render 'new'
    end


  end


  private
  def task_params
    params.require(:task).permit(:comments)
  end

end
