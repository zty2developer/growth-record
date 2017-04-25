class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
	mount_uploader :background, BackgroundUploader
end
