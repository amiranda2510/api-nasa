class CreateFavoriteImages < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_images do |t|
      t.references :list, null: false, foreign_key: true
      t.references :daily_image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
