class RemovePrefectureIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :prefecture_id, :integer
  end
end
