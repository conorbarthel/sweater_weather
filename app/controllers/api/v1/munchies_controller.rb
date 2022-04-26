class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params[:destination]
    coordinates = MapFacade.get_coords(destination)
    forecast = WeatherService.get_weather(coordinates.lat, coordinates.lng)
    destination_data = MapService.get_route(params[:start], destination)
    restaurant = YelpService.get_restaurant(destination, params[:food])
    munchie = Munchie.new(destination, restaurant, destination_data, forecast[:current])
    render(json: MunchieSerializer.new(munchie))
  end
end
