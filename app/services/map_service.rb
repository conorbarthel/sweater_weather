class MapService
  def self.conn
  Faraday.new(
    url: "http://www.mapquestapi.com/geocoding/v1/",
    params: {key: ENV['map_api']})
  end

  def self.get_coords(location)
    response = conn.get("address?location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
