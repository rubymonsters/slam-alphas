class Event < ActiveRecord::Base
  include ActiveModel::Validations

  ROLES = [
    "Moderatorin",
    "Veranstalterin"
  ]

  validates :name, :city, presence: true
  validates :url, website: true, allow_blank: true

  enum relationship: ['moderation', 'organization']

  belongs_to :user

  def self.available_roles
    available_roles_options = ROLES.map(&:to_i)
  end

end
