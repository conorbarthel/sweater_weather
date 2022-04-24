class WeatherFacade
  def self.current_weather(lat, lon)
    json = WeatherService.get_weather(lat, lon)
    CurrentWeather.new(json[:current])
  end

  def self.hourly_weather(lat, lon)
    json = WeatherService.get_weather(lat, lon)
    json[:hourly][0..7].map do |hourly_data|
      HourlyWeather.new(hourly_data)
    end
  end

  def self.daily_weather(lat, lon)
    json = WeatherService.get_weather(lat, lon)
    json[:daily][0..4].map do |daily_data|
      DailyWeather.new(daily_data)
    end
  end

  def self.forecast(lat, lon)
    Forecast.new(current_weather(lat, lon),
                  hourly_weather(lat, lon),
                  daily_weather(lat, lon))
  end
end
