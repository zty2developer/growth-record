class Feedback < ApplicationRecord
	
	def self.recent(number)
		Feedback.order("created_at desc").limit(number)
	end
end
