# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |

create_table :users do |t|
  t.string :nickname, null: false
  t.string :email, null: false, unique: true
  t.string :encrypted_password, null: false
  t.string :last_name, null: false
  t.string :first_name, null: false
  t.string :last_name_kana, null: false
  t.string :first_name_kana, null: false
  t.date :date_of_birth, null: false
  t.timestamps
end


### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |

create_table :items do |t|
  t.string :name, null: false
  t.text :description, null: false
  t.integer :price, null: false
  t.references :category, null: false, foreign_key: true
  t.references :condition, null: false, foreign_key: true
  t.references :shipping_charge, null: false, foreign_key: true
  t.references :shipping_date, null: false, foreign_key: true
  t.references :prefecture, null: false, foreign_key: true
  t.references :user, null: false, foreign_key: true
  t.timestamps
end

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |

create_table :orders do |t|
  t.references :user, null: false, foreign_key: true
  t.references :item, null: false, foreign_key: true
  t.timestamps

end
### Association
- belongs_to :user
- belongs_to :item
- has_one :payment


## paymentsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |

create_table :payments do |t|
  t.references :order, null: false, foreign_key: true
  t.string :postcode, null: false
  t.integer :prefecture_id, null: false
  t.string :city, null: false
  t.integer :block, null: false
  t.string :building
  t.string :phone_number, null: false
  t.timestamps
end

### Association
- belongs_to :order