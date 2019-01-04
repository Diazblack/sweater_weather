class Api::V1::GifsController < ApplicationController
  def index
    coordinates = Coordinate.new(CityGeoService.new(params).get_coordinates)
    exclude = "currently,minutely,hourly,alerts,flags"
    daily_weather = DarkSkyService.new({coordinate: coordinates, exclude: exclude }).weather_info

    conn = Faraday.new(url: "http://api.giphy.com/v1/gifs/search")

    response = conn.get("?q=weather&api_key=#{ENV['giphy_api_key']}&limit=8")

    giff_info = JSON.parse(response.body, symbolize_names: true)

    object = WeatherGiff.new(daily_weather[:daily][:data], giff_info[:data] )

    render json: WeatherGiffSerializer.new(object)

  end
end
