class AddSourcesListToRestaurant < ActiveRecord::Migration
  def up 
    add_column :restaurants, :sources_list, :integer, array: true, default: []
		Restaurant.reset_column_information
		Restaurant.all.each do |restaurant|
			restaurant.sources_list = restaurant.recommendations.map{|r| r.source.id}
			restaurant.sources_list_will_change!
			restaurant.save
		end
  end
	def down
    remove_column :restaurants, :sources_list
	end
end
