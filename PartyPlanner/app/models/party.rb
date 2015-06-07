class Party < ActiveRecord::Base
	has_many :attendees, class_name: "User", foreign_key: "user_id"
	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
							#this will allow use of the following:
							# @party.attendees
							# @party.organizer

	# validates :type_of_activity, presence: true
end
