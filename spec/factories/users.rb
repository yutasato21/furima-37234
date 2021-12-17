FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_japanese   { 'タロウ' }
    last_name_japanese    { 'ヤマダ' }
    birthday              { '2000-01-01' }
  end
end
