require 'rails_helper'

RSpec.describe ImageFacade do
  describe 'class methods', :vcr do
    it 'will return image details in an object' do
      image = ImageFacade.get_image("denver")

      expect(image).to be_a Image
    end
  end
end
