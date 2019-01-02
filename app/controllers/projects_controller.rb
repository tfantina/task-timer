 class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
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





  private
  def project_params
    params.require(:project).permit(:name, :start, subproject_ids: [])
  end

end
