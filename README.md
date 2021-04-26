# テーブル設計

## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false , unique: true|
| password | string | null: false               |

### Association

- has_many :item
- has_many :buy
- has_one :profile

## profiles テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| ruby_last_name  | string     | null: false |
| ruby_first_name | string     | null: false |
| birthday        | date       | null: false |
| user            | references |             |

### Association

- belongs_to :user

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| product_name  | string     | null: false |
| text          | text       | null: false |
| category      | string     | null: false |
| condition     | string     | null: false |
| burden        | string     | null: false |
| shipping_area | string     | null: false |
| shipping_days | string     | null: false |
| price         | integer    | null: false |
| user          | references |             |


### Association

- has_one :buy
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | integer    | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| buy           | references |             |

### Association

- belongs_to :buy

## buys テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | references |             |
| item    | references |             |

### Association

- has_many :address
- belongs_to :user
- belongs_to :item