class Item < ApplicationRecord
    # テーブルとのアソシエーション
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image

  with_options presence: true do
    validates :name ,presence: true
    validates :description ,presence: true
    validates :image ,presence: true
    validates :user_id ,presence: true
    validates :category_id ,presence: true
    validates :condition_id ,presence: true
    validates :shipping_charge_id ,presence: true
    validates :prefecture_id ,presence: true
    validates :shipping_date_id ,presence: true
  end

  validates :price ,presence: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price ,presence: true,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id ,presence: true
    validates :condition_id ,presence: true
    validates :shipping_charge_id ,presence: true
    validates :shipping_date_id ,presence: true
    validates :prefecture_id ,presence: true
  end
end
