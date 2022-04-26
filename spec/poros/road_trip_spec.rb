require 'rails_helper'

RSpec.describe RoadTrip do
  it "is an object that holds roadtrip info" do
    destination_data = {
                          route: {
                            formattedTime: "01:45:23",
                          },
                          locations: [
                            { adminArea5: "Denver", adminArea3: "CO"},
                            { adminArea5: "Estes Park", adminArea3: "CO" }
                          ]
                        }
    forecast_data = {
                      hourly: [
                        { temp: 283.17,
                          weather: [
                            { description: "scattered clouds" }
                          ]
                        },
                        { temp: 285.9,
                          weather: [
                            { description: "scattered clouds" }
                          ]
                        },
                        { temp: 287.9,
                          weather: [
                            { description: "sunny" }
                          ]
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
    expect(roadtrip.weather_at_eta[:temperature]).to eq(58.6)
    expect(roadtrip.weather_at_eta[:conditions]).to eq("sunny")
  end
end
