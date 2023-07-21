class RemovePostcodeFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :postcode, :string
  end
end
