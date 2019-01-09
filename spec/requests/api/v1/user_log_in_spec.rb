require 'rails_helper'

describe 'User log in' do
  before(:each) do
    @user = create(:user, email: "whatever@example.com", password: "password", api_key: "potato")
  end

  scenario 'send correct credentials and receive API key' do
    user_params =  {
      "email": "whatever@example.com",
      "password": "password"
    }

    post "/api/v1/sessions", params: user_params

    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp[:data][:attributes][:api_key]).to eq(@user.api_key)
  end

  scenario 'send incorrect credentials and receive API key' do

    user_params =  {
      "email": "theotherever@example.com",
      "password": "wordpass"
    }

    post "/api/v1/sessions", params: user_params

    expect(response.status).to eq(422)

    expect(response.body).to eq("email or password doesn't exists")
  end
end
