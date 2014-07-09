class RemoveSourceIdFromRecommendation < ActiveRecord::Migration
  def change
    remove_reference :recommendations, :source, index: true
  end
end
