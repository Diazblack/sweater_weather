class Coordinate
  attr_reader :lat,
              :lon,
              :city,
              :country

  def initialize(data)
    @city = data[:Results][0][:name]
    @country = data[:Results][0][:c]
    @lat = data[:Results][0][:lat].to_f
    @lon = data[:Results][0][:lon].to_f
  end
end
