class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :postcode
      t.integer :prefecture_id
      t.string :city
      t.string :block
      t.string :building
      t.string :phone_number
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      
      t.timestamps
    end
  end
end
