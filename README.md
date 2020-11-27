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


# meal_recordsテーブル

| Column   | Type   | Option      |  
| -------- | -------｜------------｜
| image    |        |             |
| date     | string | null: false |
| meal_as  | string | null: false |
| medicine | string | null: false |
| content  | string |             |

- belongs_to :user


# measurementsテーブル

| Column        | Type       | Option      |  
| --------------| -----------｜------------｜
| date          | date       | null: false |
| timezone      | string     | null: false |
| value         | integer    | null: false |
| user          | references | foreign_key: true |

- belongs_to :user
