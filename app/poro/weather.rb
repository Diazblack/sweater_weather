class Weather
  attr_reader :city,
              :currently,
              :hourly,
              :daily

  def initialize(weather_data, coordinate_data)
    @city = coordinate_data.city
    @country = coordinate_data.country
    @currently = current_weather(weather_data[:currently])
    @hourly = hourly_weather(weather_data[:hourly][:data])
    @daily = daily_weather(weather_data[:daily][:data])
  end

  def current_weather(hash)
    CurrentWeather.new(hash)
  end

  def hourly_weather(hash)
    hash.map do |data|
      HourlyWeather.new(data)
    end
  end

  def daily_weather(hash)
    hash.map do |data|
      DailyWeather.new(data)
    end
  end
end
