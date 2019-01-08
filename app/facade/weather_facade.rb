class WeatherFacade
  def initialize(data)
    @favorites = data[:favorites]
  end

  def favorites_weather
    @favorites.map do |favorite|
      coordinates = Coordinate.new(CityGeoService.new(location: favorite.location).get_coordinates)
      Weather.new(DarkSkyService.new({coordinate: coordinates}).weather_info, coordinates)
    end
  end
end
