FactoryBot.define do
  factory :item do
    name             {"扇風機"}
    price            {"3000"}
    text             {"扇風機です"}
    category_id      {"2"}
    status_id        {"2"}
    delivery_fee_id  {"2"}
    area_id          {"2"}
    delivery_days_id {"2"}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
