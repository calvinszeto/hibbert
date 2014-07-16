class AddImageableTypeToImages < ActiveRecord::Migration
  def change
    add_column :images, :imageable_type, :integer
  end
end
