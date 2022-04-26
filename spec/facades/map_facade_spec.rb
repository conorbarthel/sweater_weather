require 'rails_helper'

RSpec.describe MapFacade do
  describe '#get_coords', :vcr do
    it 'will return coords in an object' do
      coord = MapFacade.get_coords('Denver,CO')
      expect(coord).to be_a Coord
    end
  end
  describe '#valid?', :vcr do
    it 'will return false if trip is invalid' do
      trip = MapFacade.valid?('Denver,CO', 'London,UK')
      expect(trip).to eq(false)
    end
  end
  describe '#valid?', :vcr do
    it 'will return true if trip is valid' do
      trip = MapFacade.valid?('Denver,CO', 'EstesPark,CO')
      expect(trip).to eq(true)
    end
  end
end
