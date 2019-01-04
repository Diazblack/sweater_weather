require 'rails_helper'

describe Coordinate do
  before(:each) do
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

    @coordinate = Coordinate.new(data)
  end

  it 'exists' do
    expect(@coordinate).to be_a(Coordinate)
  end

  it 'has attributes' do
    lat = 39.740002
    lon = -104.980003

    expect(@coordinate.lat).to eq(lat)
    expect(@coordinate.lon).to eq(lon)
  end
end
