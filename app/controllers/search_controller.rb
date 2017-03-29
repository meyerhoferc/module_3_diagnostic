class SearchController < ApplicationController
  def index
    @zipcode = params[:q]
    @stations = Station.search_by_zipcode(@zipcode)
  end
end
