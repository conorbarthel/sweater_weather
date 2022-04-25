class ImageSerializer
  include JSONAPI::Serializer

    set_id :id
    set_type 'image'

    attributes :photo_url, :description, :credits
end
