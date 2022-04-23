require 'rails_helper'

Rspec.describe Coordinates do
  it "can make a coordinates object" do
    input = {
      lat: 39.125,
      lng: -104.98
    }
    coord = Coord.new(input)
    expect(coord.lat).to eq(39.125)
    expect(coord.lng).to eq(-104.98)
  end
end
