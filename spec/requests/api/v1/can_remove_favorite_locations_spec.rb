require 'rails_helper'

describe 'Favorite Remove' do
  before(:all) do
    @user = create(:user, email: "whatever@example.com", password: "password")
    @location_1 = create(:favorite, user: @user, location: "Denver, CO")
    @location_2 = create(:favorite, user: @user, location: "Golden, CO")
    @location_3 = create(:favorite, user: @user, location: "Gadsden, AL")
  end

  scenario 'Send a request to remove favorite' do
    VCR.use_cassette('remove_favorite_cassette') do
      params = {
        "api_key": "#{@user.api_key}",
        "location": "#{@location_3.location}"
      }

      delete "/api/v1/favorites", params: params

      expect(response).to be_successful

      resp = JSON.parse(response.body, symbolize_names: true)

      expect(resp.count).to eq(2)

      resp.each do |city|
        expect(city[:city]).to_not eq(@location_3.location)
      end
    end
  end

  scenario 'user send invalid Api key' do

    params = {
      "api_key": "potatoes",
      "location": "#{@location_3.location}"
    }

    delete "/api/v1/favorites", params: params

    expect(response.status).to eq(401)

    expect(response.body).to eq("Error, Unauthorized")
  end
end
