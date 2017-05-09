class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
	mount_uploader :background, BackgroundUploader
	validates :name, presence: true
	validates :name, uniqueness: true
end
