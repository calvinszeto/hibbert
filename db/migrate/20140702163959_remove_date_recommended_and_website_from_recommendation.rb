class RemoveDateRecommendedAndWebsiteFromRecommendation < ActiveRecord::Migration
  def change
    remove_column :recommendations, :date_recommended, :date
    remove_column :recommendations, :website, :string
  end
end
