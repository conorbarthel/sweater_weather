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

  def self.get_route(to, from)
    response = conn.get("/directions/v2/route?to=#{to}&from=#{from}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
