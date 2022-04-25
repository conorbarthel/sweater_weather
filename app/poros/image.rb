class Image
  attr_reader :id, :type, :photo_url, :description, :credits

  def initialize(data)
    @id = nil
    @type = "image"
    @photo_url = data[:urls][:full]
    @description = data[:alt_description]
    @credits = {
                source: "https://unsplash.com/",
                artist: data[:user][:name],
                profile: data[:user][:links][:self]
              }
  end
end
