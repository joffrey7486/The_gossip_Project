class CitiesController < ApplicationController
  before_action :authenticate_user
  def show
    @city = City.find(params[:id])
    @all_city_gossips = @city.gossips
  end
end
