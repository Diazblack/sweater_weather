class GiphyService
  def initialize
  end

  def random_giff
    get_json("?q=weather&api_key=#{ENV['giphy_api_key']}&limit=8")
  end

  private

  def get_json(uri)
    response = conn.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.giphy.com/v1/gifs/search")
  end
end
