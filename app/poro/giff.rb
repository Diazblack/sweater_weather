class Giff
  attr_reader :time,
              :summary,
              :id,
              :giff_url
              
  def initialize(hash)
    @time = hash[0][:time]
    @summary = hash[0][:summary]
    @id = hash[1][:id]
    @giff_url = hash[1][:url]
  end
end
