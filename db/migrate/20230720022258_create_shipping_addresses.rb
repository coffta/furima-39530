class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      # テーブルのカラムを定義する処理を記述
      t.timestamps
    end
  end

  def down
    drop_table :shipping_addresses
  end
end