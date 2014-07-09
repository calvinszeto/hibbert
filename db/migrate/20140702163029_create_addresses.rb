class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.float :latitude
      t.float :longitude
      t.references :addressable, index: true

      t.timestamps
    end
  end
end
