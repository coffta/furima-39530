class RemoveBuildingFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :building, :string
  end
end
