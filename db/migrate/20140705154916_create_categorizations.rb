class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category, index: true
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
