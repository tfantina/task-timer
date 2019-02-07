 class ProjectsController < ApplicationController
  before_action :authenticate_user!


  def index
    @projects = Project.all.order(name: :asc)
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.order(day: :desc)

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      flash[:success] = "Project started"
      redirect_to tasks_path
    else
      flash[:error] = "project not added"
      render 'new'
    end

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to projects_path
    else
      flash[:error] = "Project not updated"
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project Deleted"
    redirect_to projects_path
  end



  private
  def project_params
    params.require(:project).permit(:name, :start, :precentage_complete,
                                  :summary, :go_live, subproject_ids: [])
  end

end
