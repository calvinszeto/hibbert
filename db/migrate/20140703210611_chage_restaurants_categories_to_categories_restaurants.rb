require_relative '20140702163740_create_restaurants_categories'

class ChageRestaurantsCategoriesToCategoriesRestaurants < ActiveRecord::Migration
  def change
		revert CreateRestaurantsCategories

    create_table :categories_restaurants, id: false do |t|
      t.references :category, index: true
      t.references :restaurant, index: true
    end
  end
end
