class Weather
  attr_reader :city,
              :currently,
              :hourly,
              :daily

  def initialize(data)
    @city = data[:timezone]
    @currently = current_weather(data[:currently])
    @hourly = hourly_weather(data[:hourly][:data])
    @daily = daily_weather(data[:daily][:data])
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
