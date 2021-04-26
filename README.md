# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| ruby_last_name     | string | null: false               |
| ruby_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :buys
- has_one :profile

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| product_name     | string     | null: false       |
| text             | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| burden_id        | integer    | null: false       |
| prefectures_id   | integer    | null: false       |
| shipping_days_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |


### Association

- has_one :buy
- belongs_to :user

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| city           | string     | null: false       |
| house_number   | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| buy            | references | foreign_key: true |

### Association

- belongs_to :buy

## buys テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- has_one :addresses
- belongs_to :user
- belongs_to :item