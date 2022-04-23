class WeatherService
  def self.conn
  Faraday.new(
    url: "https://api.openweathermap.org/data/2.5/",
    params: {appid: ENV['weather_api']})
  end

  def self.get_weather(lat, lon)
    response = conn.get("onecall?lat=#{lat}&lon=#{lon}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
