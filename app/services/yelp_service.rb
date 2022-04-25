class YelpService
  def self.conn
    Faraday.new("https://api.yelp.com") do |faraday|
      faraday.request :authorization, 'Bearer', ENV['yelp_api']
    end
  end

  def self.get_restaurant(location, categories)
    response = conn.get("/v3/businesses/search?location=#{location}&categories=restaurant,#{categories}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
