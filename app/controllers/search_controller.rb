class SearchController < ApplicationController

  def index
    binding.pry
    @stations = Station.find_by(params[:zip])
  end
  
end
