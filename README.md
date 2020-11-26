# README

# テーブル設計

# usersテーブル

| Column             | Type   | Option      |  
| ------------------ | -------｜------------｜
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

- has_many :measurements
- has_many :meal_records

<!-- config/locales/devise.ja.ymlを編集してユーザー登録時のメッセージを日本語にすること -->

# measurementsテーブル

| Column        | Type    | Option      |  
| --------------| --------｜------------｜
| date          | date    |             |
| time          | time    |             |
| morning_value | integer | null: false |
| daytime_value | integer | null: false |
| night_value   | integer | null: false |

- belongs_to :user

# meal_recordsテーブル

| Column  | Type   | Option      |  
| ------- | -------｜------------｜
| image   |        |             |
| date    | string | null: false |
| meal_as | string | null: false |
| content | string |             |

- belongs_to :user