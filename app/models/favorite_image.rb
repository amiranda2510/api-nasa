class FavoriteImage < ApplicationRecord
  belongs_to :list
  belongs_to :daily_image
end
