# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| date_of_birth | date | null: false |


### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| description | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :payment


## ordersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| order_id(FK) | integer | null: false , foreign_key: true|
| postcode | integer | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| block | integer | null: false |
| building | string | null: false |
| phone-number | integer | null: false |

### Association
- belongs_to :order