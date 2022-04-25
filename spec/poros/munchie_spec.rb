require 'rails_helper'

RSpec.describe Munchie do
  it "is an object that holds munchie info" do
    restaurant_data = {
              businesses: [
                {
                  name: "Fortune Wok to Table",
                  location: {
                    display_address: [
                    "2817 E 3rd Ave",
                    "Denver, CO 80206"
                    ]
                  }
                }
              ]
            }
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
    munchie = Munchie.new(destination, restaurant_data, destination_data, forecast_data)
    expect(munchie.id).to eq(nil)
    expect(munchie.type).to eq("munchie")
    expect(munchie.destination_city).to eq("Pueblo,CO")
    expect(munchie.travel_time).to eq("1 hours 45 min")
    expect(munchie.forecast).to be_a Hash
    expect(munchie.forecast[:summary]).to eq("overcast clouds")
    expect(munchie.forecast[:temperature]).to eq(250.41)
    expect(munchie.restaurant).to be_a Hash
    expect(munchie.restaurant[:name]).to eq("Fortune Wok to Table")
    expect(munchie.restaurant[:address]).to eq("2817 E 3rd Ave, Denver, CO 80206")
  end
end
