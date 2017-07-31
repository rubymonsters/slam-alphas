require 'carrierwave/orm/activerecord'
require 'carrierwave/processing/mini_magick'
require 'fog/aws'

CarrierWave.configure do |config|
  # file access permissions
  config.permissions = 0666
  config.directory_permissions = 0777

  if ENV['RAILS_ENV'] ||= 'development'
    config.storage = :file
  elsif ENV['RAILS_ENV'] ||= 'test'
    config.storage = :file
    config.enable_processing = false
  else
    # Configure fog for AWS s3
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
     provider:               'AWS', # required
     aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'], # required
     aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'], # required
     region:                 ENV['S3_REGION'],  # optional, defaults to 'us-east-1'
     host:                   ENV['HOST'],  # optional, defaults to nil
     endpoint:               ENV['ENDPOINT'] # optional, defaults to nil
    }
    config.fog_directory  = ENV['S3_BUCKET'] # required
    # see https://github.com/jnicklas/carrierwave#using-amazon-s3
    # for more optional configuration
    config.fog_attributes = { 'Cache-Control' => "max-age=#{90.day.to_i}" } # optional, defaults to {}
    config.storage = :fog
    # config.asset_host = "CDN LINK HERE"
  end

  # Error messages
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
end