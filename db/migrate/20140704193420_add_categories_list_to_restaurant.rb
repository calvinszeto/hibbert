class AddCategoriesListToRestaurant < ActiveRecord::Migration
  def up
    add_column :restaurants, :categories_list, :string, array: true, default: '{}'
		Restaurant.reset_column_information
		Restaurant.all.each do |restaurant|
			restaurant.categories_list = restaurant.categories.map(&:name)
			restaurant.categories_list_will_change!
			restaurant.save
		end
  end
	def down
		remove_column :restaurants, :categories_list
	end
end
