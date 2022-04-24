require 'rails_helper'

RSpec.describe HourlyWeather do
  it "can make a weather object" do
    data = {
        dt: 1650678092,
        temp: 250.41,
        weather: [
            {
                description: "overcast clouds",
                icon: "04d"
            }
        ]
    }

    current_weather = HourlyWeather.new(data)
    expect(current_weather.time).to eq("19:41:32")
    expect(current_weather.temperature).to eq(-8.9)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end
end
