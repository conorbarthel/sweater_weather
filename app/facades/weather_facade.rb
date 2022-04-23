class WeatherFacade
  def self.current_weather(lat, lon)
    json = WeatherService.get_weather(lat, lon)
    CurrentWeather.new(json[:current])
  end

  def self.hourly_weather(lat, lon)
    json = WeatherService.get_weather(lat, lon)
    json[:hourly].map do |hourly_data|
      HourlyWeather.new(hourly_data)
    end
  end

  def self.daily_weather(lat, lon)
    json = WeatherService.get_weather(lat, lon)
    json[:daily].map do |daily_data|
      DailyWeather.new(daily_data)
    end
  end
end
