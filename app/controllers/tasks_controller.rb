class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id).paginate(
                        page: params[:page], :per_page => 5).order(day: :desc)
    @projects = Project.all
  end

  def show
      @tasks = Task.where(user_id: current_user.id)
  end

  def new
    @task = Task.new
  end

  def create

    @task = current_user.tasks.build(task_params)
    @user_task = User_task.build(user_id: current_user.id, task_id: @task.id)

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
    params.require(:task).permit(:comments, :project_id, :day, :time)
  end

end
