class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_number, :ship_area_id, :address_city, :address_no, :address_build, :tele_number, :buy_id, :item_id, :user_id

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :ship_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :address_city
    validates :address_no
    validates :tele_number, length: {maximum: 11}
    validates :item_id
    validates :user_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, ship_area_id: ship_area_id, address_city: address_city, address_no: address_no, address_build: address_build, tele_number: tele_number, buy_id: buy.id)
  end
end
