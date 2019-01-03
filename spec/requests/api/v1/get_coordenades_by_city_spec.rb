require 'rails_helper'

describe "City Geo Location API" do
  scenario "Get the lat and long of a city" do
    city = 'Denver,CO'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_succesful

    location_coordinates = JSON.parse(response.body)

    lat = "39.740002"
    lon = "-104.980003"

    expect(location_coordinates[:results][:lat]).to eq(lat)
    expect(location_coordinates[:results][:lon]).to eq(lon)
  end
end
