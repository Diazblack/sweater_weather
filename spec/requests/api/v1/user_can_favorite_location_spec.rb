require 'rails_helper'

describe 'Favorites' do
  before(:each) do
    @user = create(:user, email: "whatever@example.com", password: "password")
  end
  scenario 'user can favorite their location' do


    params = {
      "location": "Denver, CO",
      "api_key": "#{@user.api_key}"
    }

    post '/api/v1/favorites', params: params

    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:location]).to eq(params[:location])

  end

  scenario 'user send invalid Api key' do

    params = {
      "location": "Denver, CO",
      "api_key": "potatoes"
    }

    post '/api/v1/favorites', params: params

    expect(response.status).to eq(401)

    expect(response.body).to eq("Error, Unauthorized")
  end
end
