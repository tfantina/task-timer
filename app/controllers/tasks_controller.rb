class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.new
    #@usertsk = UserTask.where(user_id: current_user.id)
    #@tasks = User.where(id: current_user.id).tasks
    @tasks = current_user.tasks.paginate(page: params[:page], :per_page => 20).order(created_at: :desc)
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
      current_user.tasks << @task
      @tasks = current_user.tasks
      flash.now[:success] = "Task added"
      respond_to do |format|
          format.js {flash[:notice] = "Task added"}
         end

    else
      flash.now[:danger] = "Task not added"
      render 'new'
    end


  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      current_user.tasks << @task
      flash[:success] = "Project updated"
      redirect_to tasks_path
    else
      flash[:error] = "Project nod updated"
      render 'edit'
    end
  end


  private
  def task_params
    params.require(:task).permit(:comments, :project_id, :subproject_id, :day, :time, user_ids: [])
  end

end
