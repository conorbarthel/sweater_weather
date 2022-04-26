class RoadtripFacade
  def self.get_roadtrip(start, destination)
    destination_coords = MapFacade.get_coords(destination)
    weather = WeatherService.get_weather(destination_coords.lat, destination_coords.lng)
    route = MapService.get_route(start, destination)
    RoadTrip.new(route, weather)
  end
end
