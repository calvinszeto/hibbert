class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.references :imageable, index: true

      t.timestamps
    end
  end
end
