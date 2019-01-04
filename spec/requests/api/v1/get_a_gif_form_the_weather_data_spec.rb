require 'rails_helper'

describe 'GHPHY API' do
  scenario 'get a giff to render with the weather info' do
    stub_city_geo_api_call
    stub_dark_sky_gift_api_call

    city = 'Denver,CO'

    get "/api/v1/gifs?location=#{city}"

    expect(response).to be_successful

    giff_info = JSON.parse(response.body, symbolize_names: true)

    expect(giff_info[:daily_giffs].count).to eq(8)
    expect(giff_info[:daily_giffs][0][:time]).to eq(1546585200)
    expect(giff_info[:daily_giffs][0][:summary]).to eq("Partly cloudy until afternoon.")
    expect(giff_info[:daily_giffs][0][:id]).to eq("YnH5fDZPcNJfi")
    expect(giff_info[:daily_giffs][0][:giff_url]).to eq("https://giphy.com/gifs/weather-dancing-YnH5fDZPcNJfi")

    expect(giff_info[:daily_giffs][3][:time]).to eq(1546844400)
    expect(giff_info[:daily_giffs][3][:summary]).to eq("Mostly cloudy starting in the evening.")
    expect(giff_info[:daily_giffs][3][:id]).to eq("rsdDNSViCq8OQ")
    expect(giff_info[:daily_giffs][3][:giff_url]).to eq("https://giphy.com/gifs/beyonce-nicki-minaj-beyhive-rsdDNSViCq8OQ")

    expect(giff_info[:daily_giffs][7][:time]).to eq(1547190000)
    expect(giff_info[:daily_giffs][7][:summary]).to eq("Light snow (< 1 in.) in the morning.")
    expect(giff_info[:daily_giffs][7][:id]).to eq("dWLREYF83ciQg")
    expect(giff_info[:daily_giffs][7][:giff_url]).to eq("https://giphy.com/gifs/30-rock-weather-dWLREYF83ciQg")
  end
end
