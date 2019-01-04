class Coordinate
  attr_reader :lat,
              :lon
              
  def initialize(data)
    @lat = data[:Results][0][:lat].to_f
    @lon = data[:Results][0][:lon].to_f
  end
end
