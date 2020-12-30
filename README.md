## usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ------------|       
| email              | string     | null: false |
| nickname           | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_name_kana    | string     | null: false |
| last_name_lana     | string     | null: false |
| birthday           | date       | null: false |


encrypted_password 

### Association

- has_many :items
- has_many :deliveries

## itemsテーブル

| Column                   | Type       | Options           |
| -------------------------| ---------- | ------------------|
| name                     | string     | null: false       |
| expranation              | text       | null: false       |
| category_id              | integer    | null: false       |
| price                    | integer    | null: false       |
| quality_id               | integer    | null: false       |
| shipping_fee_burden_id   | integer    | null: false       |
| shipping_area_id         | integer    | null: false       |
| Shipping_id              | integer    | null: false       |
| user                     | references | foreign_key: true |

### Association

- has_one :item_delivery
- belongs_to :user

## item_deliveriesテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :item
- belongs_to :delivery

## deliveryテーブル

| Column              | Type       | Options           |
| --------------------| ---------- | ----------------- |
| postal_code         | string     | null: false       |
| prefectures_id      | integer    | null: false       |
| municipalities      | string     | null: false       |
| address             | string     | null: false       |
| quality             | string     | null: false       |
| building_name       | string     |                   |
| phone_number        | string     | null: false       |
| user                | references | foreign_key: true |


### Association

- has_one :item_delivery

