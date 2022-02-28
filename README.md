# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| mail                  | email   | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_ruby        | string  | null: false               |
| first_name_ruby       | string  | null: false               |
| birthday              | date    | null: false               |

### Association
- has_many :items
- has_many :buys
- has_many :comments

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| items_name             | string     | null: false                    |
| items_price            | integer    | null: false                    |
| explain                | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| delivery_day_id        | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy
- has_many :comments

## buys テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- has_many :comments
- has_many :sends

## sends テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_cord         | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| buy               | references | null: false, foreign_key: true |

### Association
- belongs_to :buy

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment     | text       | null: false,                   |
| user        | references | null: false, foreign_key: true |
| buy         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :buy