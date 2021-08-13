FactoryBot.define do
  factory :buy_address do
    post_number { '123-4567' }
    ship_area_id { 2 }
    address_city { '新宿区' }
    address_no { '1-1' }
    address_build { '新宿ハイツ' }
    tele_number { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end