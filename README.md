# README
# Sweater Weather

This application allow the user to send a location and get the Weather for the particular City and State, Create an account, Log in, save their favorites locations, and manage this favorite locations ( retrieve the weather, delete favorite).

This app consumes the the the [City Geo-Location Lookup](https://rapidapi.com/dev132/api/city-geo-location-lookup) by [Devru](https://rapidapi.com/user/dev132),that will translate a string with the city and the state ``` "Denver, CO" ``` in latitude and longitude, and give them to the [Dark sky API](https://darksky.net/dev/docs) to return information about the weather in the location



This app was built in Ruby on Rails as the Backend services endpoint. The Frontend is currently on development.


## Setup

### Clone

```
$ git clone git@github.com:Diazblack/sweater-weather-2.0.git sweater_weather
$ cd sweater_weather
```

### Bundle
After cd in the directory run bundler to install the gems

```
$ bundle
```

### Database setup

To create the production database and set the migrations

```
$ bundle exec rake db:{create,migrate}
```

__Note__: This application is built using Ruby 2.4.1, [here](https://github.com/rbenv/rbenv) is a link to the rbenv repo for more information

## Configuration

### API's

#### City Geo Location Lookup API
You can apply for a free key here [RapidAPI](https://rapidapi.com/dev132/api/city-geo-location-lookup).

#### Dark Sky API
You can apply for a free key here [Darksky docs](https://darksky.net/dev/docs), go to the section get a free key.

#### Gem: Figaro

[Figaro](https://github.com/laserlemon/figaro) is a Ruby gem that allows to hide sensitive information (API keys), figaro will create a file in the config folder call ``` config/application.yml```, and this file will be added to .gitignore file to prevent the information get push to the cloud.

Place your api's key in the application.yml

````yml
city_geo_key: your-city-geo-location-Lookup-api-key
dark_sky_key: your-dark-sky-api-key
````
## Test

To run the test suit type

```
bundle exec rspec
```

To run a particular test or folder

```
bundle exec rspec ./spec/path_to_file_or_directory
```
