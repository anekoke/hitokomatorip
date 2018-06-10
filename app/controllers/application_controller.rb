class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def count(user)
    @count_interest = user.interest_frames.count
    @count_visit = user.visit_frames.count
  end

  
end
