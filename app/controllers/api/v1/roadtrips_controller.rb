class Api::V1::RoadtripsController < ApplicationController
  def create
    origin = params[:origin]
    destination = params[:destination]
    user = User.find_by(api_key: params[:api_key])
    if user.present? == false
      render json: { error: "Unauthorized", status: 401 }
    elsif MapFacade.valid?(origin, destination) == false
      render json: { error: "Invalid RoadTrip", status: 400 }
    elsif MapFacade.valid?(origin, destination) && user.present?
      roadtrip = RoadtripFacade.get_roadtrip(origin, destination)
      render json: RoadtripSerializer.new(roadtrip), status: 201
    end
  end

end
