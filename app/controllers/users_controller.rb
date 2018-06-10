class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :interest, :visit]
  
  def index

  end

  def show
    @user = current_user
    @frames = @user.frames.order('created_at DESC').page(params[:page]).per(8)
    count(@user)
  end
  
  def interest
    @user = current_user
    @interest = @user.interest_frames.order('updated_at DESC').page(params[:page]).per(8)
    count(@user)
  end
  
  def visit
    @user = current_user
    @visit = @user.visit_frames.order('updated_at DESC').page(params[:page]).per(8)
    count(@user)
  end

end
