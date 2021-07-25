FactoryBot.define do
  factory :item do
    title             {'test'}
    description       {'test'}
    item_status_id    {"2"}
    delivery_cover_id {"2"}
    ship_area_id      {"2"}
    ship_day_id       {"2"}
    category_id       {"2"}
    money             {"9999"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample_test.png'), filename: 'sample_test.png')
    end
  end
end
