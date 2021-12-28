# テーブル設計

## users テーブル

| Column              | Type    | Option                    |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_name_japanese | string  | null: false               |
| last_name_japanese  | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| post           | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| post_number    | integer    | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
