class CreateDailyImages < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_images do |t|
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
