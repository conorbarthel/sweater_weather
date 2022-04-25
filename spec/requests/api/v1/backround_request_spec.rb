require 'rails_helper'

describe "backrounds API" do
  it "sends a backround image info", :vcr do
    get '/api/v1/backgrounds?location=denver'

    expect(response.status).to eq(200)

    image_json = JSON.parse(response.body, symbolize_names: true)
    image = image_json[:data]

    expect(image).to have_key(:id)
    expect(image[:id]).to eq(nil)

    expect(image).to have_key(:type)
    expect(image[:type]).to eq('image')

    expect(image[:attributes]).to have_key(:photo_url)

    expect(image[:attributes]).to have_key(:description)

    expect(image[:attributes]).to have_key(:credits)
    expect(image[:attributes][:credits]).to be_a(Hash)
    expect(image[:attributes][:credits]).to have_key(:source)
    expect(image[:attributes][:credits]).to have_key(:artist)
    expect(image[:attributes][:credits]).to have_key(:profile)
  end
end
