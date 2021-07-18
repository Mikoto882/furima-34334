class Item < ActiveHash::Base
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
end
