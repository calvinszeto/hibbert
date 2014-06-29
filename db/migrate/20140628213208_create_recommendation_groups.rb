class CreateRecommendationGroups < ActiveRecord::Migration
  def change
    create_table :recommendation_groups do |t|
      t.string :name
      t.string :website
      t.references :source, index: true

      t.timestamps
    end
  end
end
