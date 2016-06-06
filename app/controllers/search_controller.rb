class SearchController < ApplicationController

  def index
    stations = Station.find_by(params)
    binding.pry
     @stations = WillPaginate::Collection.create(params[:page], params[:per_page], stations.length) do |pager|
      pager.replace stations[pager.offset, pager.per_page]
    end
  end

  # def index
  #    @users = User.paginate(:page => params[:page], :per_page => 5)
  #  end

#    products = %w(i love ruby on rails)
# @products = WillPaginate::Collection.create(params[:page], params[:per_page], products.length) do |pager|
#    pager.replace products[pager.offset, pager.per_page]
# end
end
