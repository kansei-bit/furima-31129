# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | null: false |
| nickname     | string | null: false |
| lname | string | null: false |
| fname | string | null: false |
| lname_katakana | string | null: false |
| fname_katakana | string | null: false |
| birth_date | date | null: false |

##l# Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| description   | text | null: false |
| price   | integer | null: false |
| category_id   | integer | null: false |
| status_id   | integer | null: false |
| delivery_charge_id   | integer | null: false |
| prefecture_id   | integer | null: false |
| shipping_date_id   | integer | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user | references     | null: false, foreign_key: true |
| item | references     | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| zip_code | string     | null: false |
| prefecture_id | integer     | null: false |
| city | string     | null: false |
| town | string     | null: false |
| apartment_number | string     | |
| tel    | string | null: false |
| order | references | null: false, foreign_key: true |

### Association

- belongs_to :order