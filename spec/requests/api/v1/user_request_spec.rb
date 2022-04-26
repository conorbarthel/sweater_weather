require 'rails_helper'

RSpec.describe 'User create' do
  it 'happy path will create a new user', :vcr do
    user_count = User.count
    request_body = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"
                 }
    post '/api/v1/users', params: request_body

    expect(response.status).to eq(201)
    response_data = JSON.parse(response.body, symbolize_names: true)
    response = response_data[:data]

    expect(User.count).to eq(user_count + 1)
    expect(response[:type]).to eq('users')
    expect(response[:id]).to_not eq(nil)
    expect(response[:attributes]).to include(:email, :api_key)
    expect(response[:attributes][:email]).to eq('whatever@example.com')
    expect(response[:attributes][:api_key].length).to eq(26)
  end
  it "sad path will not create a user" do
    user_count = User.count
    request_body = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"
                 }
    post '/api/v1/users', params: request_body
  end
end
