class User < ActiveRecord::Base

  include Clearance::User
  include ActiveModel::Validations

  COUNTRIES = {
    de: "Deutschland",
    at: "Osterreich",
    ch: "Schweiz"
  }

  validates :name, :city, :email, :country, :year_of_birth, presence: true
  validates :name, length: { minimum: 2 }
  validates :email, uniqueness: { case_sensitive: false }, on: [:create, :update]
  validates :country, inclusion:  COUNTRIES.keys.map { |k| k.to_s }
  validates :password, confirmation: true, unless: :persisted?

  validates :recommended_by, presence: true
  validates :is_available_on, presence: true

  # customized validity check in app/validators/email_validator.rb
  validates :email, email: true

  # customized validity check in app/validators/website_validator.rb
  validates :website, website: true, allow_blank: false

  validates :facebook_link, website: true, allow_blank: false
  validates :video_link, website: true, allow_blank: false

  geocoded_by :location
  after_validation :geocode

  scope :alphas, -> { where(alpha: true) }
  scope :admin, -> { where(admin: true) }

  # According to the user rights which users is the logged_in user able to see
  def visible_for_signed_in_users
    if admin?
      User.all.order("upper(name) ASC")
    else
      # Adds the user's id to the array of public ids
      visible_ids = User.where(public: true).pluck(:id) << id
      # The logged_in user may see the users whose ids are within the visble ids and they will be sorted ascendingly
      #with a collation - adding SQL in the query
      User.where(id: visible_ids).order("upper(name) ASC")
    end
  end

  def age
    Time.now.utc.year - year_of_birth
  end

  def website_clean
    web = website.sub 'https://', ''
    web = web.sub 'http://', ''
    web
  end

  def location
    [city, country].compact.join(", ")
  end

  def country_name
    COUNTRIES[country.to_sym]
  end

  def is_available_on
    available_options = [
      ['Work Days', 1],
      ['Weekends', 2],
      ['Vacations', 3],
      ['Public Holidays', 4],
      ['Request', 5],
      ['Always', 6],
      ['Not Available', 7]
    ]

    available_options.each do |day|
      puts day.to_s
    end
  end

  def recommended_by_alpha
    user = User.find_by_id(recommended_by)
    if user.present?
      user.name
    else
      ""
    end
  end


end
