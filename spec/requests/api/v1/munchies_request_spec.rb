require 'rails_helper'

describe "munchies API" do
  it "sends a munchies info", :vcr do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'

    expect(response.status).to eq(200)

    munchie_json = JSON.parse(response.body, symbolize_names: true)
    munchie = munchie_json[:data]

    expect(munchie).to have_key(:id)
    expect(munchie[:id]).to eq(nil)

    expect(munchie).to have_key(:type)
    expect(munchie[:type]).to eq('munchie')

    expect(munchie[:attributes]).to have_key(:destination_city)
    expect(munchie[:attributes][:destination_city]).to eq("pueblo,co")

    expect(munchie[:attributes]).to have_key(:travel_time)
    expect(munchie[:attributes][:travel_time]).to eq("01 hours 45 min")

    expect(munchie[:attributes]).to have_key(:forecast)
    expect(munchie[:attributes][:forecast]).to be_a(Hash)
    expect(munchie[:attributes][:forecast]).to have_key(:temperature)
    expect(munchie[:attributes][:forecast][:temperature]).to eq(49.4)
    expect(munchie[:attributes][:forecast]).to have_key(:summary)
    expect(munchie[:attributes][:forecast][:summary]).to eq("few clouds")
    expect(munchie[:attributes][:restaurant]).to be_a(Hash)
    expect(munchie[:attributes][:restaurant]).to have_key(:name)
    expect(munchie[:attributes][:restaurant][:name]).to eq("Wonderful Bistro")
    expect(munchie[:attributes][:restaurant]).to have_key(:address)
    expect(munchie[:attributes][:restaurant][:address]).to eq("4602 N Elizabeth St, Ste 120Pueblo, CO 81008")
  end
end
