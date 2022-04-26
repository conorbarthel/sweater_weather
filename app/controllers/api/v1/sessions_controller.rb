class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Invalid Email or Password", status: 400}
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
