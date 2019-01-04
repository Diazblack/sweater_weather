require 'rails_helper'

describe 'GHPHY API' do
  scenario 'get a giff to render with the weather info' do
    stub_city_geo_api_call
    stub_dark_sky_api_call

    city = 'Denver,CO'

    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    we_info = JSON.parse(response.body, symbolize_names: true)

    expect(we_info[:daily][0][:giff]).to eq()
  end
end
