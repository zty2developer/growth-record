class Comment < ApplicationRecord
	belongs_to :post

	def self.recent(number)
		Comment.order("created_at desc").limit(number)
	end
end
