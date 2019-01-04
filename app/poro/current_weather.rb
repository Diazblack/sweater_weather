class CurrentWeather
  attr_reader :time,
              :summary,
              :icon,
              :preciporcentage,
              :temp

  def initialize(data)
    @time = Time.at(data[:time]).to_datetime
    @summary = data[:summary]
    @icon = data[:icon]
    @preciporcentage = data[:precipProbability]
    @temp = data[:temperature] if data[:temperature]
  end

end
