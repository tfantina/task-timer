class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.new
    #@usertsk = UserTask.where(user_id: current_user.id)
    #@tasks = User.where(id: current_user.id).tasks
    @tasks = current_user.tasks.paginate(page: params[:page], :per_page => 5).order(day: :desc)
    #@tasks = Task.where(user_id: current_user.id).paginate(
                      #  page: params[:page], :per_page => 5).order(day: :desc)
    @projects = Project.all
  end

  def show
      @current_usr_task = UserTasks.where(user_id: current_user.id)
      @tasks = Task.where(id: @current_usr_task.task_id)
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
      flash[:notification] = "Task not added"
  #    render 'new'
    end


  end


  private
  def task_params
    params.require(:task).permit(:comments, :project_id, :day, :time, :users )
  end

end
