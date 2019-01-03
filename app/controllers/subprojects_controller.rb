class SubprojectsController < ApplicationController

  def new
    @subproject = Subproject.new
  end

  def create
      @subproject = Subproject.create(subproject_params)

      if @subproject.save
        flash[:success] = "Subtask created"
        redirect_to tasks_path
      else
        flash[:error] = "Subtask not added"
        render 'new'
      end

    end


private
def subproject_params
  params.require(:subproject).permit(:name, :description, subproject_ids: [])
end


end
