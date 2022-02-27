# テーブル設計

## user テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| mail                  | string  | null: false, unique: true |
| password              | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| name                  | string  | null: false               |
| birthday              | integer | null: false               |
 

## item テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| items_name  | string     | null: false                    |
| items_price | integer    | null: false                    |
| explain     | text       | null: false                    |
| show        | text       | null: false                    |
| user_id     | references | null: false, foreign_key: true |

## buy テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| items_id    | references | null: false, foreign_key: true |

## send テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_cord      | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

## comment テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment     | text       | null: false,                   |
| user_id     | references | null: false, foreign_key: true |
| buy_id      | references | null: false, foreign_key: true |