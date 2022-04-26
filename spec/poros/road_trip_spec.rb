require 'rails_helper'

RSpec.describe RoadTrip do
  it "is an object that holds roadtrip info" do
    destination_data = {
                          route: {
                            formattedTime: "01:45:23",
                          }
                        }
    forecast_data = {
                      temp: 250.41,
                      weather: [
                                  {
                                    description: "overcast clouds"
                                  }
                                ]
                      }
    destination = "Pueblo,CO"
    roadtrip = RoadTrip.new(destination_data, forecast_data)
    expect(roadtrip.id).to eq(nil)
    expect(roadtrip.type).to eq("roadtrip")
    expect(roadtrip.start_city).to eq("Denver, CO")
    expect(roadtrip.end_city).to eq("Estes Park, CO")
    expect(roadtrip.travel_time).to eq("01 hours 45 min")
    expect(roadtrip.weather_at_eta).to be_a Hash
    expect(roadtrip.forecast[:temperature]).to eq(-8.9)
    expect(roadtrip.forecast[:conditions]).to eq("overcast clouds")
  end
end
