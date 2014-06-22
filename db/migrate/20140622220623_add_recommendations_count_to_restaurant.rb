class AddRecommendationsCountToRestaurant < ActiveRecord::Migration
  def up
    add_column :restaurants, :recommendations_count, :integer, :default => 0
		Restaurant.reset_column_information
		Restaurant.all.each do |r|
			r.update_attribute :recommendations_count, r.recommendations.count
		end
  end
	def down
		remove_column :restaurants, :recommendations_count
	end
end
