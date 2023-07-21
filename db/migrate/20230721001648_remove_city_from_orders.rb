class RemoveCityFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :city, :string
  end
end
