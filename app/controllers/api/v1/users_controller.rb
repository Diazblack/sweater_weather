class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if params[:password] == params[:password_confirmation] && user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: "Email already exists or password confirmation don't match", status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
