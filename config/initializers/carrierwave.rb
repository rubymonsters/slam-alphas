require 'carrierwave/orm/activerecord'
require 'carrierwave/processing/mini_magick'
require 'fog/aws'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => ENV['S3_REGION'],
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = false
    config.fog_attributes = { 'Cache-Control' => "max-age=#{90.day.to_i}" }
    config.storage = :fog
  else
    config.storage = :file
  end

  # file access permissions
  # config.permissions = 0666
  # config.directory_permissions = 0777

  # config.asset_host = "CDN LINK HERE"

  # Error messages
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
end
