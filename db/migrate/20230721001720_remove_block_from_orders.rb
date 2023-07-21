class RemoveBlockFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :block, :string
  end
end
