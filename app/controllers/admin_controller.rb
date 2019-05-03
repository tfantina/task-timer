class AdminController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
      @users = User.order(name: :asc).all
  end

  def user_tasks
    @user = User.find_by(id: params[:id])
    @tasks = @user.tasks.paginate(page: params[:page], :per_page => 25).order(sort_column + " " + sort_direction)
    @projects = Project.all.order(name: :asc)
  end

  private
  def sort_column
    %w[day time project].include?(params[:sort]) ? params[:sort] : "day"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "DESC"
  end

end
