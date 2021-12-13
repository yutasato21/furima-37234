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
| birthday            | integer | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| situation       | string     | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :address

## addresses テーブル

| Column         | Type    | Option      |
| -------------- | ------- | ----------- |
| post           | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| number         | integer | null: false |
| building       | text    |             |
| telephone      | integer | null: false |

### Association

- has_many :purchases
