class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def index
    @users = Users.all
  end

  def show
    @user = current_user
  end
end
