equire 'rails_helper'

RSpec.describe Image do
  it "is an object that holds background image info" do
    data = {
      alt_description: "Denver street artowrk",
      urls: {
        full: "https://images.unsplash.com/photo-1573297627466-6bed413a43f1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MDN8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjUwODMzODY2&ixlib=rb-1.2.1&q=85"
      },
      user: {
        name: "Pieter van de Sande",
        links: {
          self: "https://api.unsplash.com/users/planner1963"
        }
      }
    }
    image = Forecast.new(current_weather, hourly_weather, daily_weather)
    expect(image.id).to eq(nil)
    expect(image.type).to eq("image")
    expect(image.photo_url).to eq("https://images.unsplash.com/photo-1573297627466-6bed413a43f1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MDN8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjUwODMzODY2&ixlib=rb-1.2.1&q=85")
    expect(image.description).to eq("Denver street artowrk")
    expect(image.credits).to be_a Hash
    expect(image.credits[:source]).to eq("https://unsplash.com/")
    expect(image.credits[:artist]).to eq("Pieter van de Sande")
    expect(image.credits[:profile]).to eq("https://api.unsplash.com/users/planner1963")
  end
end
