class RelationshipsController < ApplicationController
  
  before_action :user_signed_in?
    
  def create
    
    frame = Frame.find_by(id: params[:frame_id])
    if params[:type] == 'Interest'
      current_user.interest(frame)
      flash[:notice] = "ひとコマに「気になる」しました"
    end
    
    redirect_back( fallback_location: root_path )
  end

  def destroy
    
    frame = Frame.find(params[:frame_id])
    if params[:type] == 'Interest'
      current_user.uninterest(frame)
      flash[:notice] = "ひとコマの「気になる」を解除しました"
    end
    
    redirect_back( fallback_location: root_path )
  end
end
