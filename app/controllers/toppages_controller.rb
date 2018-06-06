class ToppagesController < ApplicationController
  def index
    @search = Frame.search(params[:q])
    @frames = @search.result
  end
end
