require 'rails_helper'

RSpec.describe YelpService do
  describe '#conn' do
    it "returns json response" do
      response = YelpService.conn

      expect(response).to be_a Faraday::Connection
    end
  end

  describe '#get_restaurant' do
    it 'will return JSON of a restaurant', :vcr do
      restaurant_details = YelpService.get_restaurant('pueblo,co', 'chinese')
      expect(restaurant_details).to be_a Hash
      expect(restaurant_details[:businesses]).to be_a Array
      expect(restaurant_details[:businesses].first).to be_a Hash
      expect(restaurant_details[:businesses].first).to include(:name, :location)
      expect(restaurant_details[:businesses].first[:location]).to be_a Hash
      expect(restaurant_details[:businesses].first[:location][:display_address]).to be_a Array
    end
  end
end
