class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = MapFacade.get_coords(params[:location])
    forecast = WeatherFacade.forecast(coordinates.lat, coordinates.lng)

    render(json: WeatherSerializer.new(forecast))
  end
end
