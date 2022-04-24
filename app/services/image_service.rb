class ImageService
  def self.conn
  Faraday.new(
    url: "https://api.unsplash.com/",
    params: {client_id: ENV['image_api']})
  end

  def self.get_image(search)
    response = conn.get("search/photos?page=1&query=#{search}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
