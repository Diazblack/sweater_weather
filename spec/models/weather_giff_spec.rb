require 'rails_helper'

describe WeatherGiff do
  before(:each) do
    @weather_info = [{
                      :time=>1546585200,
                      :summary=>"Partly cloudy until afternoon.",
                      :icon=>"partly-cloudy-day",
                      :sunriseTime=>1546611743,
                      :sunsetTime=>1546645779,
                      :moonPhase=>0.96,
                      :precipIntensity=>0,
                      :precipIntensityMax=>0,
                      :precipProbability=>0,
                      :temperatureHigh=>57.36,
                      :temperatureHighTime=>1546635600,
                      :temperatureLow=>25.19,
                      :temperatureLowTime=>1546696800,
                      :apparentTemperatureHigh=>57.36,
                      :apparentTemperatureHighTime=>1546635600,
                      :apparentTemperatureLow=>18.48,
                      :apparentTemperatureLowTime=>1546696800,
                      :dewPoint=>20.94,
                      :humidity=>0.45,
                      :pressure=>1014.15,
                      :windSpeed=>2.69,
                      :windGust=>10.51,
                      :windGustTime=>1546592400,
                      :windBearing=>193,
                      :cloudCover=>0.12,
                      :uvIndex=>2,
                      :uvIndexTime=>1546624800,
                      :visibility=>10,
                      :ozone=>264.69,
                      :temperatureMin=>31.72,
                      :temperatureMinTime=>1546610400,
                      :temperatureMax=>57.36,
                      :temperatureMaxTime=>1546635600,
                      :apparentTemperatureMin=>29.27,
                      :apparentTemperatureMinTime=>1546668000,
                      :apparentTemperatureMax=>57.36,
                      :apparentTemperatureMaxTime=>1546635600
                    }]

    @giff_info = [{
                  :type=>"gif",
                  :id=>"YnH5fDZPcNJfi",
                  :slug=>"weather-dancing-YnH5fDZPcNJfi",
                  :url=>"https://giphy.com/gifs/weather-dancing-YnH5fDZPcNJfi",
                  :bitly_gif_url=>"https://gph.is/1aR8gb7",
                  :bitly_url=>"https://gph.is/1aR8gb7",
                  :embed_url=>"https://giphy.com/embed/YnH5fDZPcNJfi",
                  :username=>"",
                  :source=>"https://fuckyeahstupidgifs.tumblr.com/post/467135804/via-fuckyeahalbuquerque",
                  :rating=>"g",
                  :content_url=>"",
                  :source_tld=>"fuckyeahstupidgifs.tumblr.com",
                  :source_post_url=>"https://fuckyeahstupidgifs.tumblr.com/post/467135804/via-fuckyeahalbuquerque",
                  :is_sticker=>0,
                  :import_datetime=>"2013-06-27 14:35:52",
                  :trending_datetime=>"2014-09-14 22:22:02",
                  :images=>
                   {:fixed_height_still=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200_s.gif", :width=>"141", :height=>"200"},
                    :original_still=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy_s.gif", :width=>"281", :height=>"400"},
                    :fixed_width=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200w.gif",
                      :width=>"200",
                      :height=>"285",
                      :size=>"43769",
                      :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200w.mp4",
                      :mp4_size=>"156042",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200w.webp",
                      :webp_size=>"1087634"},
                    :fixed_height_small_still=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100_s.gif", :width=>"70", :height=>"100"},
                    :fixed_height_downsampled=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200_d.gif",
                      :width=>"141",
                      :height=>"200",
                      :size=>"133597",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200_d.webp",
                      :webp_size=>"61584"},
                    :preview=>{:width=>"280", :height=>"400", :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-preview.mp4", :mp4_size=>"41410"},
                    :fixed_height_small=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100.gif",
                      :width=>"70",
                      :height=>"100",
                      :size=>"27609",
                      :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100.mp4",
                      :mp4_size=>"30934",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100.webp",
                      :webp_size=>"75186"},
                    :downsized_still=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-downsized_s.gif", :width=>"281", :height=>"400", :size=>"46985"},
                    :downsized=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-downsized.gif", :width=>"281", :height=>"400", :size=>"102121"},
                    :downsized_large=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy.gif", :width=>"281", :height=>"400", :size=>"102121"},
                    :fixed_width_small_still=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100w_s.gif", :width=>"100", :height=>"142"},
                    :preview_webp=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-preview.webp", :width=>"179", :height=>"255", :size=>"48442"},
                    :fixed_width_still=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200w_s.gif", :width=>"200", :height=>"285"},
                    :fixed_width_small=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100w.gif",
                      :width=>"100",
                      :height=>"142",
                      :size=>"43769",
                      :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100w.mp4",
                      :mp4_size=>"44033",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/100w.webp",
                      :webp_size=>"114926"},
                    :downsized_small=>
                     {:width=>"280", :height=>"400", :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-downsized-small.mp4", :mp4_size=>"62504"},
                    :fixed_width_downsampled=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200w_d.gif",
                      :width=>"200",
                      :height=>"285",
                      :size=>"235270",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200w_d.webp",
                      :webp_size=>"108846"},
                    :downsized_medium=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy.gif", :width=>"281", :height=>"400", :size=>"102121"},
                    :original=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy.gif",
                      :width=>"281",
                      :height=>"400",
                      :size=>"102121",
                      :frames=>"60",
                      :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy.mp4",
                      :mp4_size=>"152120",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy.webp",
                      :webp_size=>"468760"},
                    :fixed_height=>
                     {:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200.gif",
                      :width=>"141",
                      :height=>"200",
                      :size=>"27609",
                      :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200.mp4",
                      :mp4_size=>"154541",
                      :webp=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/200.webp",
                      :webp_size=>"614406"},
                    :looping=>{:mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-loop.mp4", :mp4_size=>"501104"},
                    :original_mp4=>{:width=>"480", :height=>"682", :mp4=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy.mp4", :mp4_size=>"152120"},
                    :preview_gif=>{:url=>"https://media0.giphy.com/media/YnH5fDZPcNJfi/giphy-preview.gif", :width=>"237", :height=>"338", :size=>"49740"},
                    :"480w_still"=>{:url=>"https://media1.giphy.com/media/YnH5fDZPcNJfi/480w_s.jpg", :width=>"480", :height=>"683"}},
                  :title=>"hammer time dancing GIF",
                  :_score=>2500020.5,
                  :analytics=>
                   {:onload=>
                     {:url=>
                       "https://giphy_analytics.giphy.com/simple_analytics?response_id=5c2f90c7343050636bf62851&event_type=GIF_SEARCH&gif_id=YnH5fDZPcNJfi&action_type=SEEN"},
                    :onclick=>
                     {:url=>
                       "https://giphy_analytics.giphy.com/simple_analytics?response_id=5c2f90c7343050636bf62851&event_type=GIF_SEARCH&gif_id=YnH5fDZPcNJfi&action_type=CLICK"},
                    :onsent=>
                     {:url=>
                       "https://giphy_analytics.giphy.com/simple_analytics?response_id=5c2f90c7343050636bf62851&event_type=GIF_SEARCH&gif_id=YnH5fDZPcNJfi&action_type=SENT"
                }}}]

    @WeaGiff = WeatherGiff.new(@weather_info, @giff_info)
  end

  it 'exists' do
    expect(@WeaGiff).to be_a(WeatherGiff)
  end

  it 'has attributes' do

    expect(@WeaGiff.daily_giffs.count).to eq(1)
    expect(@WeaGiff.daily_giffs[0]).to be_a(Giff)
  end
end
