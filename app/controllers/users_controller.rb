class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def index
    @users = Users.all
  end

  def show
    @user = current_user
    @frames = @user.frames.uniq
    @count_interest = @user.interest_frames.count
    @count_visit = @user.visit_frames.count
  end
  
end
