class Api::V1::ForecastController < ApplicationController
  def index
    @location = CityGeoService.new(params).get_coordinates
  end
end
