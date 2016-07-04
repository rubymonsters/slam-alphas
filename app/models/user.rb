class User < ActiveRecord::Base
include ActiveModel::Validations
	validates :name, :city, :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }, on: :create
	validates :email, uniqueness: { case_sensitive: false }, on: :update

	# customized validity check in app/validators/email_validator.rb
	validates :email, email: true
end
