class Post < ApplicationRecord
	paginates_per 5
  belongs_to :category
end
