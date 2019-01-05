require 'rails_helper'

describe 'User log in' do
  scenario 'send correct credentials and receive API key' do
    user = create(:user, email: "whatever@example.com", password: "password", api_key: "potato")

    user_params =  {
      "email": "whatever@example.com",
      "password": "password"
    }

    post "/api/v1/sessions", params: user_params

    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:api_key]).to eq(user.api_key)

    expect(current_user).to eq(user)
  end
end
