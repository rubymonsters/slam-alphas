class AvatarUploader < CarrierWave::Uploader::Base
  require 'carrierwave/orm/activerecord'
  require 'carrierwave/processing/mini_magick'

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    '/tmp/image-cache'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  end

  # Process files as they are uploaded:
  # process resize_to_limit: [800, 800]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # Image on user detail page (show)
  version :medium do
    process resize_to_fill: [300, 300]
    process convert: 'jpg'
    process :store_meta
  end

  # Save performance memory by resizing from a resized resource (thumb)
  version :thumb, from_version: :medium do
    process resize_to_fill: [125, 125]
    process convert: 'jpg'
    process :store_meta
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Allow only images to upload
  def content_type_whitelist
    /image\//
  end

  # Reject specific content types
  def content_type_blacklist
    ['application/text', 'application/json']
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
