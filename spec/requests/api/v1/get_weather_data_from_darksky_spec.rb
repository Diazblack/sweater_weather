require 'rails_helper'

describe "Darksky API" do
  scenario "Get weather information using the latitude and longitude of a city" do
    stub_city_geo_api_call
    stub_dark_sky_api_call

    city = 'Denver,CO'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    we_info = JSON.parse(response.body, symbolize_names: true)

    expect(we_info[:city]).to eq("Denver, Colorado")
    expect(we_info[:currently][:temp]).to eq(43.49)
    expect(we_info[:hourly].count).to eq(49)
    expect(we_info[:hourly][0][:temp]).to eq(46.15)
    expect(we_info[:hourly][48][:icon]).to eq("cloudy")
    expect(we_info[:hourly][48][:icon]).to eq("cloudy")
    expect(we_info[:daily].count).to eq(8)
    expect(we_info[:daily][0][:summary]).to eq("Clear throughout the day.")
    expect(we_info[:daily][7][:mintemp]).to eq(29.78)
    expect(we_info[:daily][7][:maxtemp]).to eq(60.34)
  end
end
