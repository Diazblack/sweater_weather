class Api::V1::GifsController < ApplicationController
  def index
    coordinates = Coordinate.new(CityGeoService.new(params).get_coordinates)
    exclude = "currently,minutely,hourly,alerts,flags"
    daily_weather = DarkSkyService.new({coordinate: coordinates, exclude: exclude }).weather_info
    gift = GiphyService.new(daily_weather)
    require "pry"; binding.pry
  end
end
