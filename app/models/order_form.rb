class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone__number, :item_id, :user_id

  validates :postcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :phone__number, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
  
  def save
    # UserとItemのレコードを作成
    user = User.create!(
      nickname: "Sample Nickname", # ニックネームのデフォルト値
      date_of_birth: Date.today # 誕生日のデフォルト値
    )

    item = Item.find(item_id) # item_idに対応するItemレコードを取得

    # Orderのレコードを作成
    order = Order.create!(
      postcode: postcode,
      prefecture_id: prefecture_id,
      city: city,
      block: block,
      building: building,
      phone_number: phone_number,
      item_id: item.id,
      user_id: user.id
    )
    
    # ここでトランザクションを使用して、必要なデータを全て保存
    ActiveRecord::Base.transaction do
      user.save!
      item.save!
      order.save!
    end
  end

end, 