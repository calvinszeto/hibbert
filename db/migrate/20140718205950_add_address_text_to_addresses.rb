class AddAddressTextToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :address_text, :string
  end
end
