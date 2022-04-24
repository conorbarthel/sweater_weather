require 'rails_helper'

RSpec.describe Forecast do
  it "is an object that holds weather objects" do
    current_data = {
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
    hourly_data = {
        dt: 1650678092,
        temp: 250.41,
        weather: [
            {
                description: "overcast clouds",
                icon: "04d"
            }
        ]
    }
    daily_data = {
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
    current_weather = CurrentWeather.new(current_data)
    hourly_weather = [HourlyWeather.new(hourly_data)]
    daily_weather = [DailyWeather.new(daily_data)]
    forecast = Forecast.new(current_weather, hourly_weather, daily_weather)
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.hourly_weather.first).to be_a HourlyWeather
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.daily_weather).to be_a Array
    expect(forecast.daily_weather.first).to be_a DailyWeather
  end
end
