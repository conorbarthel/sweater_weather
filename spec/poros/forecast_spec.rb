require 'rails_helper'

RSpec.describe Forecast do
  it "is an object that holds weather objects" do
    hourly_weather = [create(:hourly_weather, 8)]
    daily_weather = [create(:daily_weather, 5)]
    current_weather = create(:current_weather)
    forecast = Forecast.new(current_weather, hourly_weather, daily_weather)
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.hourly_weather.first).to be_a HourlyWeather
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.daily_weather).to be_a Array
    expect(forecast.daily_weather.first).to be_a DailyWeather
  end
end
