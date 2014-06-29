class AddRecommendationGroupIdToRecommendation < ActiveRecord::Migration
  def change
    add_reference :recommendations, :recommendation_group, index: true
  end
end
