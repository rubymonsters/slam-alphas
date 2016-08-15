class User < ActiveRecord::Base
include ActiveModel::Validations
	validates :name, :city, :email, presence: true
	validates :name, length: { minimum: 2 }
	validates :email, uniqueness: { case_sensitive: false }, on: [:create, :update]

	# customized validity check in app/validators/email_validator.rb
	validates :email, email: true

  # customized validity check in app/validators/website_validator.rb
	validates :website, website: true, allow_blank: true

	validates :facebook_link, website: true, allow_blank: true
end
