require 'rails_helper'

describe GiphyService do
  before(:all) do
    @service = GiphyService.new()
  end
  it 'exists' do
    expect(@service).to be_a GiphyService
  end
  context "Instance Methods" do
    context "random_giff" do
      it 'should return an array of hashes' do
        VCR.use_cassette('giphy_service_cassette') do
          expect(@service.random_giff).to be_a(Hash)
          expect(@service.random_giff[:data]).to be_a(Array)

          expect(@service.random_giff[:data][0]).to have_key(:id)
          expect(@service.random_giff[:data][0]).to have_key(:url)
          expect(@service.random_giff[:data][7]).to have_key(:id)
          expect(@service.random_giff[:data][7]).to have_key(:url)
        end 
      end
    end
  end
end
