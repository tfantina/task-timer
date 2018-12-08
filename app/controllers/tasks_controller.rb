class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
  end

  def show
      @tasks = Task.where(user_id: current_user.id)
      respond_to do |format|
        format.js
      end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
    if @task.save
      flash[:success] = "Task added"
        format.js
    else
      flash[:error] = "Task not added"
      render 'new'
    end
  end
  end


  private
  def task_params
    params.require(:task).permit(:comments)
  end



end
