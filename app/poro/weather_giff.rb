class WeatherGiff
  
  def initialize(weather, giff)
    @giff = get_giff(weather, giff)
  end

  def get_giff(data_1, data_2 )
    data_1.zip(data_2).map do |giff|
      Giff.new(giff)
    end
  end
end
