# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計


## users テーブル

| Column             | Type        | Options       |
| ------------------ | ----------- | ------------- |
| email              | string      | unique: false |
| encrypted_password | string      | null: false   |
| last_name          | string      | null: false   |
| first_name         | string      | null: false   |
| last_name_read     | string      | null: false   |
| first_name_read    | string      | null: false   |
| birth_year         | active_hash | null: false   |
| birth_month        | active_hash | null: false   |
| birth_day          | active_hash | null: false   |
| nickname           | string      | null: false   |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column         | Type        | Option                         |
| -------------- | ----------- | ------------------------------ |
| title          | string      | null: false                    |
| comment        | text        | null: false                    |
| item_status    | active_hash | null: false                    |
| delivery_cover | active_hash | null: false                    |
| ship_area      | active_hash | null: false                    |
| ship_day       | active_hash | null: false                    |
| category       | active_hash | null: false                    |
| money          | text        | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buys

## buys テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| number   | string     | null: false                    |
| deadline | string     | null: false                    |
| security | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column      | Type   | Option      |
| ----------- | ------ | ----------- |
| post_number | string | null: false |
| address     | text   | null: false |
| tele_number | string | null: false |
