class MapFacade
  def self.get_coords(location)
    json = MapService.get_coords(location)
    Coord.new(json[:results].first[:locations].first[:latLng])
  end
end
