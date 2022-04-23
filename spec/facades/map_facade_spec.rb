require 'rails_helper'

RSpec.describe MapFacade do
  describe '#get_coords', :vcr do
    it 'will return coords in an object' do
      coord = MapFacade.get_coords('Denver,CO')
      expect(coord).to be_a Coord
    end
  end
end
