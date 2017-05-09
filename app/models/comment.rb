class Comment < ApplicationRecord
	belongs_to :post
	validates :commentor_name, :content, :post, presence: true

	def self.recent(number)
		Comment.order("created_at desc").limit(number)
	end
end
