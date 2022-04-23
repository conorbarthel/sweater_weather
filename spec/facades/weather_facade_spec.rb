require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'class methods', :vcr do
    it 'will return current weather in an object' do
      current_weather = WeatherFacade.current_weather(39.7385, 104.984853)

      expect(current_weather).to be_a CurrentWeather
    end
    it 'will return hourly weather in objects' do
      hourly_weather = WeatherFacade.hourly_weather(39.7385, 104.984853)

      expect(hourly_weather).to be_a HourlyWeather
    end
    it 'will return daily weather in objects' do
      daily_weather = WeatherFacade.daily_weather(39.7385, 104.984853)

      expect(daily_weather).to be_a DailyWeather
    end
  end
end
