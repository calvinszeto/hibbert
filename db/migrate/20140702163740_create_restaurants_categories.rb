class CreateRestaurantsCategories < ActiveRecord::Migration
  def change
    create_table :restaurants_categories, id: false do |t|
      t.references :restaurant, index: true
      t.references :category, index: true
    end
  end
end
