require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter "/spec"
end

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
require 'vcr'


VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<X-Mashape-Key>") { ENV['city_geo_key'] }
  config.filter_sensitive_data("<dark_sky_key>") { ENV['dark_sky_key'] }
  config.filter_sensitive_data("<giphy_api_key>") { ENV['giphy_api_key'] }
end
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end

def stub_city_geo_api_call
  stub_request(:get, "https://devru-latitude-longitude-find-v1.p.mashape.com/latlon.php?location=Denver,CO").
  to_return(body: File.read("./spec/fixtures/city_geo_coordinates.json"))
end

def stub_dark_sky_api_call
  stub_request(:get, "https://api.darksky.net/forecast/#{ENV['dark_sky_key']}/39.740002,-104.980003?exclude=minutely,flags").
  to_return(body: File.read("./spec/fixtures/darksky_weather_info.json"))
end

def stub_dark_sky_gift_api_call
  stub_request(:get, "https://api.darksky.net/forecast/#{ENV['dark_sky_key']}/39.740002,-104.980003?exclude=currently,minutely,hourly,alerts,flags").
  to_return(body: File.read("./spec/fixtures/giff_weather_info.json"))
end

def stub_giphy_api_call
  stub_request(:get, "http://api.giphy.com/v1/gifs/search?q=weather&api_key=#{ENV['giphy_api_key']}&limit=8").
  to_return(body: File.read("./spec/fixtures/giff_info.json"))
end
