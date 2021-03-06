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

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false, unique: false |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_read     | string | null: false                |
| first_name_read    | string | null: false                |
| birthday           | date   | null: false                |
| nickname           | string | null: false                |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type       | Option            |
| ----------------- | ---------- | ----------------- |
| title             | string     | null: false       |
| description       | text       | null: false       |
| item_status_id    | integer    | null: false       |
| delivery_cover_id | integer    | null: false       |
| ship_area_id      | integer    | null: false       |
| ship_day_id       | integer    | null: false       |
| category_id       | integer    | null: false       |
| money             | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| post_number   | string     | null: false       |
| ship_area_id  | integer    | null: false       |
| address_city  | string     | null: false       |
| address_no    | string     | null: false       |
| address_build | string     |                   |
| tele_number   | string     | null: false       |
| buy           | references | foreign_key: true |

### Association

- belongs_to :buy
