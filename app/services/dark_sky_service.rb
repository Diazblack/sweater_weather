class DarkSkyService
  def initialize(data)
    @filter = data
  end

  def weather_info
    get_json("/forecast/#{ENV['dark_sky_key']}/#{@filter[:coordinate].lat},#{@filter[:coordinate].lon}?exclude=#{@filter[:exclude]}")
  end
  
  private

  def get_json(uri)
    response = conn.get(uri)
    a = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.darksky.net" )
  end
end
