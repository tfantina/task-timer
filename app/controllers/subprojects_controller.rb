class SubprojectsController < ApplicationController

  def new
    @subproject = Subproject.new
  end

  def create
      @subproject = Subproject.create(subproject_params)

      if @subproject.save
        flash[:success] = "Project started"
        redirect_to tasks_path
      else
        flash[:error] = "project not added"
        render 'new'
      end

    end


private
def project_params
  params.require(:project).permit(:name, :start)
end


end
