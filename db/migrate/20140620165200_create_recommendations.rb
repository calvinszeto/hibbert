class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :restaurant, index: true
      t.references :source, index: true
      t.date :date_recommended
      t.string :website

      t.timestamps
    end
  end
end
