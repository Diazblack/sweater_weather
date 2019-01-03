require 'rails_helper'

describe "City Geo Location API" do
  scenario "Get the lat and long of a city" do
    stub_city_geo_api_call
    city = 'Denver,CO'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    location_coordinates = JSON.parse(response.body, symbolize_names: true)

    lat = '39.740002'
    lon = '-104.980003'

    expect(location_coordinates[:Results][0][:lat]).to eq(lat)
    expect(location_coordinates[:Results][0][:lon]).to eq(lon)
  end
end
