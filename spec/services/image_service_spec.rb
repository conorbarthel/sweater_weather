require 'rails_helper'

RSpec.describe ImageService do
  describe '#conn' do
    it "returns json response" do
      response = ImageService.conn

      expect(response).to be_a Faraday::Connection
    end
  end
  describe '#get_coords' do
    it 'will return JSON of a image', :vcr do
      image_response = ImageService.('denver')
      expect(image_response).to be_a Hash
      expect(image_response[:results]).to be_a Array
      expect(image_response[:results].first).to include(:urls, :alt_description, :user)
      expect(image_response[:results].first[:urls]).to include(:full)
      expect(image_response[:results].first[:user]).to include(:name, :links)
      expect(image_response[:results].first[:user][:links]).to include(:self)
    end
  end
end
