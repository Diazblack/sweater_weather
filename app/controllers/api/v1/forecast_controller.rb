class Api::V1::ForecastController < ApplicationController
  def index
    render json: CityGeoService.new(params).get_coordinates
  end
end
