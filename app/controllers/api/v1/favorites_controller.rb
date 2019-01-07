class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params_location
      location = user.favorites.create(params_location)
      render json: FavoritesSerializer.new(location)
    else
      render json: "Error, Unauthorized", status: 401
    end
  end

  private

  def params_location
    params.permit(:location)
  end
end
