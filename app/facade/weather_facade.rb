class WeatherFacade
  def initialize(data)
    @filter = data
  end

  def forecast
    call_services(@filter[:location])
  end

  def favorites_weather
    @filter[:favorites].map do |favorite|
      call_services(favorite.location)
    end
  end

  private

  def call_services(location)
    city_geo_coordinates = CityGeoService.new(location: location).get_coordinates
    coordinates = Coordinate.new(city_geo_coordinates)
    Weather.new(DarkSkyService.new({coordinate: coordinates}).weather_info, coordinates)
  end
end
