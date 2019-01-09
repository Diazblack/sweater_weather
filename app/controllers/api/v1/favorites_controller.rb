class Api::V1::FavoritesController < ApplicationController
  def index
    if find_user
      favorites = find_user.favorites
      render json: WeatherFacade.new(favorites: favorites).favorites_weather, status: 200
    else
      render json: "Error, Unauthorized", status: 401
    end
  end

  def create
    if find_user && params_location
      location = find_user.favorites.create(params_location)
      render json: FavoritesSerializer.new(location)
    else
      render json: "Error, Unauthorized", status: 401
    end
  end

  def destroy
    if find_user
      favorites = find_user.delete_favorite(params[:location])
      render json: WeatherFacade.new(favorites: favorites).favorites_weather
    else
      render json: "Error, Unauthorized", status: 401
    end

  end
  private

  def params_location
    params.permit(:location)
  end

  def find_user
    User.find_by(api_key: params[:api_key])
  end
end
