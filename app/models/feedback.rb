class Feedback < ApplicationRecord
	validates :name, :email, :description, presence: true
	
	def self.recent(number)
		Feedback.order("created_at desc").limit(number)
	end
end
