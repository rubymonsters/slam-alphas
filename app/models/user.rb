class User < ActiveRecord::Base
include ActiveModel::Validations
	validates :name, :city, :email, presence: true
end
