class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.references :user, index: true
      t.string :recent_addresses
      t.string :recent_categories
      t.string :no_show_sources
      t.string :no_show_restaurants
      t.string :tried_restaurants

      t.timestamps
    end
  end
end
