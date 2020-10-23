FactoryBot.define do
  factory :item do
    name {Faker::Beer.name}
    description {Faker::Lorem.sentence}
    price {Faker::Number.number(digits: 6)}
    category_id {2}
    status_id {2}
    delivery_charge_id {2}
    prefecture_id {2}
    shipping_date_id {2}
    association :user

    after(:build) do | item |
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
