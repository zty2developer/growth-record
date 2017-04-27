class Post < ApplicationRecord
	paginates_per 5
  belongs_to :category
	has_many :comments, dependent: :destroy
end
