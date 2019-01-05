require 'rails_helper'

describe 'User log in' do
  scenario 'send correct credentials and receive API key' do
    user = create(:user, email: "whatever@example.com", password: "password", api_key: "potato")

    params =  {
      "email": "whatever@example.com",
      "password": "password"
    }

    post "/api/v1/sessions", params: params

    expect(response).to be_successfull

    resp = JSON.parse(response.body, symbolize_names: true)
    
    expect(resp[:api_key]).to eq(user.api_key)
  end
end
