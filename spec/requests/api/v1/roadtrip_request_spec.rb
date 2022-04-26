require 'rails_helper'

RSpec.describe 'RoadTrip create' do
  it 'happy path will create a new roadtrip', :vcr do
    user = User.create!(email:"whatever@example.com", password: 'password', password_confirmation: 'password')
    request_body = {
                    origin: "Denver,CO",
                    destination: "EstesPark,CO",
                    api_key: user.api_key
                  }
    post '/api/v1/roadtrips', params: request_body

    expect(response.status).to eq(200)
    response_data = JSON.parse(response.body, symbolize_names: true)
    response = response_data[:data]

    expect(response[:type]).to eq('users')
    expect(response[:id]).to_not eq(nil)
    expect(response[:attributes]).to include(:start_city, :end_city, :travel_time, :weather_at_eta)
    expect(response[:attributes][:start_city]).to eq('Denver, CO')
    expect(response[:attributes][:end_city]).to eq('Estes Park, CO')
    expect(response[:attributes][:travel_time]).to eq('')
    expect(response[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(response[:attributes][:weather_at_eta][:temperature]).to eq(54)
    expect(response[:attributes][:weather_at_eta][:temperature]).to eq('scattered clouds')
    expect(response[:attributes]).to_not include(:api_key)
    expect(response).to_not include(:password)
    expect(response[:attributes]).to_not include(:password)
  end
  it "sad path will not create a roadtrip if api_key is wrong", :vcr do
    User.create!(email:"whatever@example.com", password: 'Password', password_confirmation: 'Password')
    request_body = {
                      origin: "Denver,CO",
                      destination: "Pueblo,CO",
                      api_key: "not_api"
                 }
    post '/api/v1/roadtrips', params: request_body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(401)
    expect(parsed[:error]).to eq("Unauthorized")
  end
  it "sad path will not create a roadtrip if api_key does not exist", :vcr do
    request_body = {
                      origin: "Denver,CO",
                      destination: "Pueblo,CO"
                 }

    post '/api/v1/roadtrips', params: request_body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(401)
    expect(parsed[:error]).to eq("Unauthorized")
  end
  it "sad path will not create a roadtrip if roadtrip is impossible", :vcr do
    user = User.create!(email:"whatever@example.com", password: 'password', password_confirmation: 'password')
    request_body = {
                      origin: "Denver,CO",
                      destination: "London,UK",
                      api_key: user.api_key
                 }

    post '/api/v1/roadtrips', params: request_body
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(400)
    expect(parsed[:error]).to eq("Invalid RoadTrip")
  end
end
