require 'redis'

if Rails.env.production?
  REDIS = Redis.connect(url: ENV['REDISTOGO_URL'])

  Geocoder.configure(
    timeout: 3,
    lookup: :mapbox,
    api_key: Rails.application.secrets.mapbox_api_key,
    cache: Redis.new
  )
end
