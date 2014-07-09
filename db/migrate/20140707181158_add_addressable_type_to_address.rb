class AddAddressableTypeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :addressable_type, :integer
  end
end
