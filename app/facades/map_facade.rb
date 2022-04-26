class MapFacade
  def self.get_coords(location)
    json = MapService.get_coords(location)
    Coord.new(json[:results].first[:locations].first[:latLng])
  end

  def self.valid?(from, to)
    json = MapService.get_route(from, to)
    if json[:route][:routeError][:errorCode] == 2
      return false
    else
      return true
    end
  end
end
