class CityGeoService
  def initialize(data)
    @filter = data
  end

  def get_coordinates
    get_json("/latlon.php?location=#{@filter[:location]}")
  end

  private

  def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => "https://devru-latitude-longitude-find-v1.p.mashape.com" ) do |f|
      f.headers['X-Mashape-Key'] = ENV['city_geo_key']
      f.headers['Accept'] = 'application/json'
      f.adapter Faraday.default_adapter
    end
  end
end
