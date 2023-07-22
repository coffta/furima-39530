class DropShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    drop_table :shipping_addresses
  end
end