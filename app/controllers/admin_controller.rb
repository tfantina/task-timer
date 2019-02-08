class AdminController < ApplicationController
  before_action :user_is_admin?
  def index
    
  end
end


private

def user_is_admin?
  unless current_user.admin?
    redirect_to tasks_path
  end
end
