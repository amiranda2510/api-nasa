class DailyImage < ApplicationRecord
  has_many :favorite_images, dependent: :destroy
  has_many :lists, through: :favorite_images
end
