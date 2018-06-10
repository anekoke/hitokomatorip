class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def require_user_admin(user)
    unless current_user && user.admin_flg?
     redirect_to root_url
    end
  end
  
  def count(user)
    @count_interest = user.interest_frames.count
    @count_visit = user.visit_frames.count
  end

  
end
