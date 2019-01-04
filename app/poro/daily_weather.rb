class DailyWeather < CurrentWeather
  def initialize(data)
    super(data)
    @mintemp = data[:temperatureLow]
    @maxtemp = data[:temperatureHigh]
  end
end
