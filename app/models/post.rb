class Post < ApplicationRecord
	paginates_per 5
  belongs_to :category
	has_many :comments, dependent: :destroy
	validates :title, :summary, :body, :category, presence: true
	validates :title, uniqueness: true

	def self.recent(number)
		Post.order("created_at desc").limit(number)
	end
end
