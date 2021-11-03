class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @all_city_gossips = @city.gossips
  end
end
