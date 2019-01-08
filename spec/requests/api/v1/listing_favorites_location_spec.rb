require 'rails_helper'

describe 'Listing Favorites' do
  scenario 'send a get request for a list of favorites' do
    user = create(:user, email: "whatever@example.com", password: "password")
    location_1 = create(:favorite, user: user, location: "Denver, CO")
    location_2 = create(:favorite, user: user, location: "Golden, CO")
    location_3 = create(:favorite, user: user, location: "Gadsden, AL")

    params = {
      "api_key": "#{user.api_key}"
    }

    get "/api/v1/favorites", params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp.count).to eq(3)
    expect(resp[0][:city]).to eq("Denver, Colorado")
    expect(resp[0][:currently][:summary]).to eq("Clear")
    expect(resp[0][:hourly].count).to eq(49)
    expect(resp[0][:daily].count).to eq(8)
    expect(resp[1][:city]).to eq("Golden, Colorado")
    expect(resp[2][:city]).to eq("Gadsden, Alabama")
  end
end
