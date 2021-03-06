class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  helper_method :sort_column, :sort_direction
  def index
    @task = Task.new
    @tasks = current_user.tasks.paginate(page: params[:page], :per_page => 25).order(sort_column + " " + sort_direction)
    @projects = Project.all.order(name: :asc)
    @task_global = Task.all.order(day: :desc)

    @user_list = User.where.not(id: current_user.id).order(name: :asc)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="magictrackr_export_dump.xlsx"'
        #redirect_to admin_index_path
      }
    end
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

    respond_to do |format|
      if @task.save
        current_user.tasks << @task
        @tasks = current_user.tasks
        format.js {flash.now[:notice] = "Task added"}
        #redirect_to :action => 'new'
         @user_list = User.where.not(id: current_user.id).order(name: :asc)
      else
        flash.now[:danger] = "Task not added"
        format.html { render 'new'}
        format.js { render 'err'}

      end
    end


  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      current_user.tasks << @task
      flash[:success] = "Task updated"
      redirect_to tasks_path
    else
      flash[:error] = "Task not updated"
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task Deleted"
    redirect_to tasks_path
  end


  private
  def task_params
    params.require(:task).permit(:comments, :project_id, :subproject_id, :day, :time, user_ids: [])
  end


  def correct_user
    @task = Task.find_by(id: params[:id])
    unless current_user.admin? or @task.user_ids.include? current_user.id
      redirect_to tasks_path
    end
  end

  def sort_column
    %w[day time project].include?(params[:sort]) ? params[:sort] : "day"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "DESC"
  end
end
