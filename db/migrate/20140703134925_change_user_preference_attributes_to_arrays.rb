require_relative '20140702163306_create_user_preferences'

class ChangeUserPreferenceAttributesToArrays < ActiveRecord::Migration
  def change
		revert CreateUserPreferences

    create_table :user_preferences do |t|
      t.references :user, index: true
      t.string :no_show_sources, array: true, default: '{}'
      t.string :no_show_restaurants, array: true, default: '{}'
      t.string :tried_restaurants, array: true, default: '{}'

      t.timestamps
    end
  end
end
