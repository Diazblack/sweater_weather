class Api::V1::GifsController < ApplicationController
  def index
    coordinates = Coordinate.new(CityGeoService.new(params).get_coordinates)
    exclude = "currently,minutely,hourly,alerts,flags"
    daily_weather = DarkSkyService.new({coordinate: coordinates, exclude: exclude }).weather_info

    giff_info = GiphyService.new().random_giff

    render json:   object = WeatherGiff.new(daily_weather[:daily][:data], giff_info[:data] )

  end
end
