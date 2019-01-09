class Api::V1::FavoritesController < ApplicationController
  def index
    if find_user
      favorites = find_user.favorites
      weather_array = WeatherFacade.new(favorites: favorites).favorites_weather
      render json: weather_array, status: 200
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
      fav_to_delete = find_user.favorites.find_by(location: params[:location])
      fav_to_delete.delete if fav_to_delete
      favorites = find_user.favorites
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
