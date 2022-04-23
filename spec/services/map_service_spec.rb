require 'rails_helper'

RSpec.describe MapService do
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
  # describe 'one charity' do
  #   it 'will return one charity given an EIN', :vcr do
  #     charity = MapService.one_charity(270823236)
  #     expect(charity).to be_a Hash
  #     expect(charity).to include(:charityNavigatorURL, :mission, :charityName, :ein, :irsClassification)
  #   end
  # end
end
