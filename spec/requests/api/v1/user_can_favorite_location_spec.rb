require 'rails_helper'

describe 'Favorites' do
  scenario 'user can favorite their location' do
    user = create(:user, email: "whatever@example.com", password: "password")

    params = {
      "location": "Denver, CO",
      "api_key": "#{user.api_key}"
    }

    post '/api/v1/favorites', params: params

    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

  end
end
