class AddWebsiteToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :website, :string
  end
end
