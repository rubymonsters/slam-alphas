class User < ActiveRecord::Base

  include Clearance::User
  include ActiveModel::Validations

  COUNTRIES = {
    de: "Deutschland",
    at: "Osterreich",
    ch: "Schweiz"
  }

	validates :name, :city, :email, :country, presence: true
	validates :name, length: { minimum: 2 }
	validates :email, uniqueness: { case_sensitive: false }, on: [:create, :update]
  validates :country, inclusion:  COUNTRIES.keys.map { |k| k.to_s }
  validates :password, confirmation: true, unless: :persisted?

  # customized validity check in app/validators/email_validator.rb
  validates :email, email: true

  # customized validity check in app/validators/website_validator.rb
  validates :website, website: true, allow_blank: true

  validates :facebook_link, website: true, allow_blank: true
  validates :video_link, website: true, allow_blank: true  

  geocoded_by :location
  after_validation :geocode

  def location
    [city, country].compact.join(", ")
  end

  def country_name
    COUNTRIES[country.to_sym]
  end

end
