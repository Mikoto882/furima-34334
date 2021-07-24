class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :item_status_id
    validates :delivery_cover_id
    validates :ship_area_id
    validates :ship_day_id
    validates :category_id
    validates :money
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :delivery_cover
  validates :delivery_cover_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :item_status
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :ship_area
  validates :ship_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :ship_day
  validates :ship_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
