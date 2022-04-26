require 'rails_helper'

RSpec.describe RoadtripFacade do
  describe 'class methods', :vcr do
    it 'will return roadtrip details in an object' do
      roadtrip = RoadtripFacade.get_roadtrip('Denver,CO', 'EstesPark,CO')

      expect(roadtrip).to be_a(RoadTrip)
    end
  end
end
