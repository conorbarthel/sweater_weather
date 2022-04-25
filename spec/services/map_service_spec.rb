require 'rails_helper'

RSpec.describe MapService do
  describe '#conn' do
    it "returns json response" do
      response = MapService.conn

      expect(response).to be_a Faraday::Connection
    end
  end
  describe '#get_coords' do
    it 'will return JSON of a location', :vcr do
      map_details = MapService.get_coords('Denver,CO')
      expect(map_details).to be_a Hash
      expect(map_details[:results]).to be_a Array
      expect(map_details[:results].first).to be_a Hash
      expect(map_details[:results].first[:locations]).to be_a Array
      expect(map_details[:results].first[:locations].first).to be_a Hash
      expect(map_details[:results].first[:locations].first).to include(:latLng)
      expect(map_details[:results].first[:locations].first[:latLng]).to include(:lat, :lng)
    end
  end
  describe '#get_route' do
    it 'will return JSON of a route', :vcr do
      map_details = MapService.get_route('Denver,CO', 'Pueblo,CO')
      expect(map_details).to be_a Hash
      expect(map_details[:route]).to be_a Hasah
      expect(map_details[:route]).to include([:formattedTime])
    end
  end
end
