class WeatherGiffSerializer
  include FastJsonapi::ObjectSerializer
  has_many :giff

  attributes :id, :daily_giffs

end
