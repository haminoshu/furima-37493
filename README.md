# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| mail                  | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_ruby        | string  | null: false               |
| first_name_ruby       | string  | null: false               |
| birthday              | date    | null: false               |
 

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  | string     | null: false                    |
| items_name             | string     | null: false                    |
| items_price            | string     | null: false                    |
| explain                | text       | null: false                    |
| show                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| delivery_day_id        | integer    | null: false                    |
| sales_commission       | integer    | null: false                    |
| sales_profit           | integer    | null: false                    |
| user_id                | references | null: false, foreign_key: true |

## buys テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| buyer       | string     | null:false                     |
| items_id    | references | null: false, foreign_key: true |

## sends テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_cord         | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipality_id   | integer    | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| buyer_id          | references | null: false, foreign_key: true |

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment     | text       | null: false,                   |
| user_id     | references | null: false, foreign_key: true |
| buy_id      | references | null: false, foreign_key: true |