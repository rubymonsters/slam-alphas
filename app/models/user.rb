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

  geocoded_by :location
  after_validation :geocode

# According to the user rights which users is the logged_in user able to see
  def visible_for_signed_in_users
    if signed_in_as_admin?
      User.all.order("upper(name) ASC")
    else
      # Adds the user's id to the array of public ids
      visible_ids = User.where(public: true).pluck(:id) << id
      # The logged_in user may see the users whose ids are within the visble ids and they will be sorted ascendingly
      #with a collation - adding SQL in the query
      User.where(id: visible_ids).order("upper(name) ASC")
    end
  end

  def location
    [city, country].compact.join(", ")
  end

  def country_name
    COUNTRIES[country.to_sym]
  end

end
