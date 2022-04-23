require 'rails_helper'

RSpec.describe WeatherService do
  describe '#conn' do
    it "returns json response" do
      response = WeatherService.conn

      expect(response).to be_a Faraday::Connection
    end
  end
  describe '#get_weather' do
    it 'will return weather JSON', :vcr do
      weather = WeatherService.get_weather(39.738453, -104.984853)
      expect(weather).to be_a Hash
      expect(weather[:current]).to be_a Hash
      expect(weather[:current][:weather]).to be_a Array
      expect(weather[:current][:weather].first).to be_a Hash
      expect(weather[:hourly]).to be_a Array
      expect(weather[:daily]).to be_a Array
      expect(weather[:current]).to include(:dt,
                                            :sunrise,
                                            :sunset,
                                            :temp,
                                            :feels_like,
                                            :humidity,
                                            :uvi,
                                            :visibility,
                                            :weather)
      expect(weather[:current][:weather].first).to include(:description, :icon)
      expect(weather[:hourly].first).to include(:datetime,
                                                :temperature,
                                                :weather)
      expect(weather[:hourly].first[:weather].first).to include(:description, :icon)
      expect(weather[:daily].first).to include(:datetime,
                                                :sunrise,
                                                :sunset,
                                                :max_temp,
                                                :min_temp,
                                                :weather)
      expect(weather[:daily].first[:weather].first).to include(:description, :icon)
    end
  end
end
