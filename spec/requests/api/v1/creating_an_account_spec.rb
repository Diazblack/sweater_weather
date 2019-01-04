require 'rails_helper'

describe 'Our API key' do
  scenario 'can receive user info and generate a key' do

    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    response_info = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(response_info[:data][:attributes][:api_key]).to eq(user.api_key)
    expect(response_info[:data][:attributes][:email]).to_not eq(user.email)
    expect(response_info[:data][:attributes][:password_digest]).to_not eq(user.password_digest)

  end

  scenario 'bad request due user email already exists in the db' do

    user = create(:user, email: 'whatever@example.com')

    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"

    expect(response.status).to eq(400)

    expect(response.body).to eq("Email already exists or password confirmation don't match")

  end

  scenario "bad request de password confirmation don't match" do

    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password_!@!W@"

    expect(response.status).to eq(400)

    expect(response.body).to eq("Email already exists or password confirmation don't match")

  end
end
