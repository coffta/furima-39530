class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
   # paymentモデルのバリデーション
   validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
   validates :city, presence: true
   validates :block, presence: true
   validates :building, allow_blank: true
   validates :phone_number, presence: true, format: {with: /\A[0-9]{11}\z/, message: "is invalid. "}
   # orderモデルのバリデーション
   validates :item_id, presence: true
   validates :user_id, presence: true
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # orderオブジェクトからorder_idを取得して@order_formにセット
    self.order_id = order.id
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    Payment.create(order_id: order_id, postal_code: postal_code, prefecture: prefecture, city: city, block: block, building: building, phone_number: phone_number)
  end

end