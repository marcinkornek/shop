FactoryGirl.define do
  factory :address do
    first_name            Faker::Name.first_name
    last_name             Faker::Name.last_name
    tel_num               Faker::PhoneNumber.subscriber_number(9)
    street                Faker::Address.street_name
    house_num             Faker::Number.digit
    town                  Faker::Address.city
    postcode              '11-111'
    user
  end
end
