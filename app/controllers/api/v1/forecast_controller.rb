class Api::V1::ForecastController < ApplicationController
  def index
    render json: WeatherFacade.new(params).forecast
  end
end
