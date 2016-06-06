class SearchController < ApplicationController

  def index
    @stations = Station.find_by(params)
  end

end
