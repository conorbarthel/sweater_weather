require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'class methods', :vcr do
    it 'will return roadtrip details in an object' do
      roadtrip = RoadTripFacade.get_roadtrip(to, from)

      expect(roadtrip).to be_a RoadTrip
    end
  end
end
