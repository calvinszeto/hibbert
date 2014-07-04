class RemoveSourcesCountFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :sources_count, :integer
  end
end
