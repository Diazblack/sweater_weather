require 'rails_helper'

describe DarkSkyService do
  before(:all) do
    data = {
        "powerdBy": "deVru",
        "Results": [
            {
                "name": "Denver, Colorado",
                "type": "city",
                "c": "US",
                "zmw": "80201.1.99999",
                "tz": "America/Denver",
                "tzs": "MST",
                "l": "/q/zmw:80201.1.99999",
                "ll": "39.740002 -104.980003",
                "lat": "39.740002",
                "lon": "-104.980003"
            }
        ]
    }
    coor = Coordinate.new(data)

    @service = DarkSkyService.new({coordinate: coor})
  end
  it 'exists' do
    expect(@service).to be_a DarkSkyService
  end
  context "Instance Methods" do
    context "get_coordinates" do
      it 'should return an array of hashes' do
        VCR.use_cassette("dark_sky_service_cassette") do

          expect(@service.weather_info).to be_a(Hash)
          expect(@service.weather_info[:currently]).to be_a(Hash)
          expect(@service.weather_info[:currently]).to have_key(:time)
          expect(@service.weather_info[:currently]).to have_key(:summary)
          expect(@service.weather_info[:currently]).to have_key(:icon)
          expect(@service.weather_info[:currently]).to have_key(:precipProbability)
          expect(@service.weather_info[:currently]).to have_key(:temperature)
          expect(@service.weather_info[:hourly]).to be_a(Hash)
          expect(@service.weather_info[:hourly][:data]).to be_a(Array)
          expect(@service.weather_info[:hourly][:data][0]).to have_key(:time)
          expect(@service.weather_info[:hourly][:data][0]).to have_key(:summary)
          expect(@service.weather_info[:hourly][:data][0]).to have_key(:icon)
          expect(@service.weather_info[:hourly][:data][0]).to have_key(:precipProbability)
          expect(@service.weather_info[:hourly][:data][0]).to have_key(:temperature)
          expect(@service.weather_info[:daily]).to be_a(Hash)
          expect(@service.weather_info[:daily][:data]).to be_a(Array)
          expect(@service.weather_info[:daily][:data][0]).to have_key(:time)
          expect(@service.weather_info[:daily][:data][0]).to have_key(:summary)
          expect(@service.weather_info[:daily][:data][0]).to have_key(:icon)
          expect(@service.weather_info[:daily][:data][0]).to have_key(:precipProbability)
          expect(@service.weather_info[:daily][:data][0]).to have_key(:temperatureHigh)
          expect(@service.weather_info[:daily][:data][0]).to have_key(:temperatureLow)
        end
      end
    end
  end
end
