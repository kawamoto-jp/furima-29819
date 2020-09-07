# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nick_name          | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :buyings


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| text             | text       | null: false                    |
| category_id      | intenger   | null: false                    |
| status_id        | intenger   | null: false                    |
| delivery_fee_id  | intenger   | null: false                    |
| area_id          | intenger   | null: false                    |
| delivery_days_id | intenger   | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buying


## buyings テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer


## buyers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| tel             | string     | null: false                    |
| buying          | references | null: false, foreign_key: true |

### Association

- belongs_to :buying

