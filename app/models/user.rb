# coding: utf-8
class User < ActiveRecord::Base

  include Clearance::User
  include ActiveModel::Validations

  COUNTRIES = {
    de: "Deutschland",
    at: "Osterreich",
    ch: "Schweiz"
  }

  AVAILABLE_OPTIONS = [
    'Wochentage',
    'Wochenende',
    'Schulferien',
    'Semesterferien',
    'Feiertage',
    'auf Anfrage',
    'Nicht verfügbar'
  ]

  WILL_TRAVEL = {
    '50' => 'innerhalb von 50km',
    '100' => 'innerhalb von 100km',
    '300' => 'innerhalb von 300km',
    'jede'=> 'jede Entfernung',
    'keine'=> 'zur Zeit keine'
  }

  TRAVELS_VIA_OPTIONS = [
    'Bahn',
    'Bus',
    'Auto (eigenes)',
    'Mietwagen',
    'Flugzeug'
  ]

  TRAIN_BONUS_CARDS = [
    'Bahncard 25',
    'Bahncard 50',
    'Bahncard 100',
    'Vorteilscard',
    'Österreichcard',
    'Halbtax',
    'General Abonnement'
  ]

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
  validates :website, website: true, allow_blank: true
  validates :facebook_link, website: true, allow_blank: true
  validates :video_link, website: true, allow_blank: false

  validates :will_travel, presence: true

  geocoded_by :location
  after_validation :geocode

  scope :alphas, -> { where(alpha: true) }
  scope :admin, -> { where(admin: true) }

  def self.sort_by_name(users)
    users.sort { |a, b| a.last_name <=> b.last_name }
  end

  # According to the user rights which users is the logged_in user able to see
  def visible_for_signed_in_users
    if admin?
      User.sort_by_name(User.all)
    else
      # Adds the user's id to the array of public ids
      visible_ids = User.where(public: true).pluck(:id) << id
      User.sort_by_name(User.where(id: visible_ids))
    end
  end

  def last_name
    name.split(" ").last
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

  def self.available_form_options
    AVAILABLE_OPTIONS.map.with_index { |day, i| [day, i] }
  end

  def available_at
    num = is_available_on.map(&:to_i)
    AVAILABLE_OPTIONS.select.with_index { |day, i| day if num.include?(i) }
  end

  def self.travels_via_form_options
    TRAVELS_VIA_OPTIONS.map.with_index { |way, i| [way, i] }
  end

  def travels_with
    transport_options = travels_via.map(&:to_i)
    TRAVELS_VIA_OPTIONS.select.with_index { |way, i| way if transport_options.include?(i) }
  end

  def self.train_bonus_card_form_optins
    TRAIN_BONUS_CARDS.map.with_index { |card, i| [card, i] }
  end

  def has_train_bonus_card
    train_bonus_card_options = train_bonus_card.map(&:to_i)
    TRAIN_BONUS_CARDS.select.with_index { |card, i| card if train_bonus_card_options.include?(i) }
  end

  def recommended_by_alpha
    user = User.find_by_id(recommended_by)
    if user.present?
      user.name
    else
      ""
    end
  end

  def will_travel_within
    WILL_TRAVEL[will_travel]
  end
end
