class AddSourcesCountToRestaurant < ActiveRecord::Migration
  def up
    add_column :restaurants, :sources_count, :integer, :default => 0
		Restaurant.reset_column_information
		Restaurant.all.each do |r|
			r.update_attribute :sources_count, r.sources.count
		end
  end
	def down
		remove_column :restaurants, :sources_count
	end
end
