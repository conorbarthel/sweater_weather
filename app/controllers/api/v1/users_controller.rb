class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.password != user.password_confirmation
      render json: { status: 400, error: "Passwords Don't Match" }
    elsif User.find_by(email: user[:email]).present?
      render json: { status: 400, error: "Account Already Exists" }
    else
      user.save
      render json: UserSerializer.new(user), status: 201
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
