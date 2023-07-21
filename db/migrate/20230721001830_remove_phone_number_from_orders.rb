class RemovePhoneNumberFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :phone_number, :string
  end
end
