require 'rails_helper'

describe CityGeoService do
  before(:all) do
      @service = CityGeoService.new({location: "Denver,CO"})
  end
  it 'exists' do
    expect(@service).to be_a CityGeoService
  end
  context "Instance Methods" do
    context "get_coordinates" do
      it 'should return an array of hashes' do
        VCR.use_cassette("city_geo_service_cassette") do

          expect(@service.get_coordinates[:Results]).to be_a(Array)
          expect(@service.get_coordinates[:Results][0]).to be_a(Hash)
          expect(@service.get_coordinates[:Results][0]).to have_key(:lat)
          expect(@service.get_coordinates[:Results][0]).to have_key(:lon)
        end
      end
    end
  end
end
