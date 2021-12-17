FactoryBot.define do
  factory :product do
    name               { Faker::Name.name }
    text               { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 2..11) }
    situation_id       { Faker::Number.within(range: 2..7) }
    delivery_charge_id { Faker::Number.within(range: 2..3) }
    prefectures_id     { Faker::Number.within(range: 2..48) }
    delivery_day_id    { Faker::Number.within(range: 2..4) }
    price              { Faker::Number.within(range: 300..9_999_999) }

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/Honda_CB400.png'), filename: 'Honda_CB400.png')
    end
  end
end
