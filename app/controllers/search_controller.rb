class SearchController < ApplicationController
  def index
    @stations = Station.search_by_zipcode(params[:q])
  end
end
