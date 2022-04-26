class MapService
  def self.conn
  Faraday.new(
    url: "http://www.mapquestapi.com",
    params: {key: ENV['map_api']})
  end

  def self.get_coords(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(from, to)
    response = conn.get("/directions/v2/route?from=#{from}&to=#{to}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
