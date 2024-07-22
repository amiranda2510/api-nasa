class List < ApplicationRecord
  belongs_to :user
  has_many :favorite_images, dependent: :destroy
  has_many :daily_images, through: :favorite_images
end
