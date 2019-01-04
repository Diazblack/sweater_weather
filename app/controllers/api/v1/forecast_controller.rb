class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = Coordinate.new(CityGeoService.new(params).get_coordinates)
    render json: Weather.new(DarkSkyService.new({coordinate: coordinates}).weather_full_info)
  end
end
