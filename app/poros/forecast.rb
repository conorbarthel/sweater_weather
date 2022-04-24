class Forecast
  attr_reader :daily_weather, :hourly_weather, :current_weather

  def initialize(current_weather, hourly_weather, daily_weather)
    @current_weather = current_weather
    @hourly_weather = hourly_weather
    @daily_weather = daily_weather
  end
end
