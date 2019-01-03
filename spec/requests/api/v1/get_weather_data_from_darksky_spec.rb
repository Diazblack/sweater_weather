require 'rails_helper'

describe "Darksky API" do
  scenario "Get weather information using the latitude and longitude of a city" do
    stub_city_geo_api_call
    city = 'Denver,CO'

    get "/api/v1/forecast?location=#{city}"
    
  end
end
