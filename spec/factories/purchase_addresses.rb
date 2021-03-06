FactoryBot.define do
  factory :purchase_address do
    post           { '000-0000' }
    prefectures_id { Faker::Number.within(range: 2..48) }
    municipalities { Faker::Address.city }
    post_number    { Faker::Address.building_number }
    building       { 'MyOffice' }
    telephone      { Faker::Number.number(digits: 11) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
