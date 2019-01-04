class WeatherGiff
  attr_reader :daily_giffs

  def initialize(weather, giff)
    @daily_giffs = get_giff(weather, giff)
  end

  def get_giff(data_1, data_2 )
    a = data_1.zip(data_2).map do |giff|
      Giff.new(giff)
    end
  end

end
