require 'rails_helper'

RSpec.describe DailyWeather do
  it "can make a weather object" do
    data = {
        dt: 1650678092,
        sunrise: 1650629522,
        sunset: 1650678266,
        temp: {
                min: 250.41,
                max: 291.81
              },
        weather: [
            {
                description: "overcast clouds",
                icon: "04d"
            }
        ]
    }

    current_weather = DailyWeather.new(data)
    expect(current_weather.datetime).to eq("2022-04-22")
    expect(current_weather.sunrise).to eq("2022-04-22 06:12:02 -0600")
    expect(current_weather.sunset).to eq("2022-04-22 19:44:26 -0600")
    expect(current_weather.max_temp).to eq(291.81)
    expect(current_weather.min_temp).to eq(250.41)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end
end
