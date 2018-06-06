class FramesController < ApplicationController
  
  def show
    @frame = Frame.find(params[:id])
  end
  
end
