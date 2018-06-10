class FramesController < ApplicationController
  
  before_action :require_user_admin, only: [ :new, :create, :edit, :update, :destroy ]
  
  def index
    @search = Frame.ransack(params[:q])
    @frames = @search.result.order('updated_at DESC').page(params[:page]).per(6)
    
  end
  
  def show
    set_frame
    @interest_users = @frame.interest_users
    @visit_users = @frame.visit_users
  end
  
  def new
    @frame = Frame.new  
  end
  
  def create
    @frame = Frame.new(frame_params)
    
    if @frame.save
      flash[:success] = "ひとコマの登録に成功しました"
      redirect_to @frame
    else
      flash.now[:danger] ="ひとコマの登録に失敗しました"
      render :new
    end
  end
  
  def edit
    set_frame
  end
  
  def update
    set_frame
    
    if @frame.update(frame_params)
      flash[:success] = "ひとコマの登録に成功しました"
      redirect_to @frame
    else
      flash.now[:danger] ="ひとコマの登録に失敗しました"
      render :new
    end
  end
  
  def destroy
    set_frame
    @frame.destroy
    
    flash[:success] = "ひとコマを削除しました"
    redirect_to root_url
    
  end
  
  private
  
  def set_frame
    @frame = Frame.find(params[:id])
  end
  
  def frame_params
    params.require(:frame).permit( :name, :content, :latitude, :longitude, :image )
  end
  
end
