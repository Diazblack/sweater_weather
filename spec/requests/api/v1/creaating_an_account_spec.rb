require 'rails_helper'

describe 'Our API key' do
  scenario 'can receive user info and generate a key' do

    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"

    expect(response).to be_successful

    response_info = JSON.parse(response.body, symbolize_names: true)

    expect(response_info[:api_key]).to eq(1)
  end
end
