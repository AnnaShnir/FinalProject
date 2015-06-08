class User < ActiveRecord::Base
	#has_secure_password
	belongs_to :parties
	#validates :email, presence: true, uniqueness: {message: "You're partying too much - you've already logged in before!"}
end
