require 'rails_helper'

RSpec.describe 'Session create' do
  it 'happy path will create a new session', :vcr do
    User.create!(email:"whatever@example.com", password: '1', password_confirmation: '1')
    request_body = {
                      email: "whatever@example.com",
                      password: "password",
                 }
    post '/api/v1/sessions', params: request_body

    expect(response.status).to eq(201)
    response_data = JSON.parse(response.body, symbolize_names: true)
    response = response_data[:data]

    expect(User.count).to eq(user_count + 1)
    expect(response[:type]).to eq('users')
    expect(response[:id]).to_not eq(nil)
    expect(response[:attributes]).to include(:email, :api_key)
    expect(response[:attributes][:email]).to eq('whatever@example.com')
    expect(response[:attributes][:api_key].length).to eq(26)
    expect(response).to_not include(:password)
    expect(response[:attributes]).to_not include(:password)
  end
  it "sad path will not create a session if password is wrong", :vcr do
    User.create!(email:"whatever@example.com", password: '1', password_confirmation: '1')
    request_body = {
                      email: "whatever@example.com",
                      password: "not_pass"
                 }
    post '/api/v1/sessions', params: request_body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(400)
    expect(parsed[:error]).to eq("Invalid Email or Password")
  end
  it "sad path will not create a session if user does not exist", :vcr do
    request_body = {
                      email: "whatever@example.com",
                      password: "password"
                 }

    post '/api/v1/sessions', params: request_body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(400)
    expect(parsed[:error]).to eq("Invalid Email or Password")
  end
end
