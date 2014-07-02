class AddDateAndDescriptionToRecommendationGroup < ActiveRecord::Migration
  def change
    add_column :recommendation_groups, :date, :date
    add_column :recommendation_groups, :description, :text
  end
end
