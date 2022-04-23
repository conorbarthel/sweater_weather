require 'rails_helper'

RSpec.describe CurrentWeather do
  it "can make a weather object" do
    data = {
        dt: 1650678092,
        sunrise: 1650629522,
        sunset: 1650678266,
        temp: 291.81,
        feels_like: 290.41,
        humidity: 26,
        uvi: 0,
        visibility: 10000,
        weather: [
            {
                description: "overcast clouds",
                icon: "04d"
            }
        ]
    }

    current_weather = CurrentWeather.new(data)
    expect(current_weather.datetime).to eq("2022-04-22 19:41:32 -0600")
    expect(current_weather.sunrise).to eq("2022-04-22 06:12:02 -0600")
    expect(current_weather.sunset).to eq("2022-04-22 19:44:26 -0600")
    expect(current_weather.temperature).to eq(291.81)
    expect(current_weather.feels_like).to eq(290.41)
    expect(current_weather.humidity).to eq(26)
    expect(current_weather.uvi).to eq(0)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end
end
