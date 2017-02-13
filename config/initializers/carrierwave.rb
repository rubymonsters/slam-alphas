CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :fog
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false

  # Configure fog for AWS s3
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'xxx',       # required
    :aws_secret_access_key  => 'yyy',       # required
    :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'name_of_your_aws_bucket' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end
