class Party < ActiveRecord::Base
	has_many :users
	# validates :type_of_activity, presence: true
end
