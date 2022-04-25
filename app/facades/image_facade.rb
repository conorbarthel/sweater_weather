class ImageFacade
  def self.get_image(search)
    json = ImageService.get_image(search)
    Image.new(json[:results].first)
  end
end
