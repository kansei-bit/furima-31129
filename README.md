# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | null: false |
| nickname     | string | null: false |
| fullname | string | null: false |
| kananame | string | null: false |
| birth_date | date | null: false |

### Association

- has_many :items

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
| item | references     | null: false, foreign_key: true |
| creditcard    | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
-has_one :address
-has_one :creditcard

## creditcards テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| number | integer     | null: false |
| expiration_month | integer     | null: false |
| expiration_year | integer     | null: false |
| security_code | integer     | null: false |
| order    | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| zipcode | integer     | null: false |
| prefecture_id | integer     | null: false |
| city | string     | null: false |
| town | string     | null: false |
| apartment_number | string     | |
| tel    | integer | null: false |
| order    | references | null: false, foreign_key: true |

### Association

- belongs_to :order