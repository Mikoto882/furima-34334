class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
    validates :description
    with_options numericality: {other_than: 1, message: "can't be blank"} do
      validates :item_status_id
      validates :delivery_cover_id
      validates :ship_area_id
      validates :ship_day_id
      validates :category_id
    end
    validates :money, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: 'is invalid'}
  end

  belongs_to :user
  has_one_attached :image
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_cover
  belongs_to :item_status
  belongs_to :ship_area
  belongs_to :ship_day
end
