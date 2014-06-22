class RemoveWebsiteFromRecommendation < ActiveRecord::Migration
  def change
    remove_column :recommendations, :website, :string
  end
end
