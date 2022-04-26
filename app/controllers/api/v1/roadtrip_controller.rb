class Api::V1::RoadTripsController < ApplicationController
  def create

    roadtrip =
    user = User.find_by(api_key: params[:api_key])
    if user.present? && MapFacade.valid?(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(roadtrip), status: 201
    elsif user.present? == false
      render json: { error: "Unauthorized", status: 401 }
    elsif MapFacade.valid?(params[:origin], params[:destination]) == false
      render json: { error: "Invalid RoadTrip", status: 400 }
    end
  end

end
