class AdminController < ApplicationController
  def index
      @users = User.order(name: :asc).all
  end
end
