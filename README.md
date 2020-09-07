# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :buyings

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| price         | string     | null: false                    |
| image         | string     | null: false                    |
| text          | string     | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| area          | string     | null: false                    |
| delivery_days | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

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

## buyer テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| tel             | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :buying

