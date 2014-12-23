FactoryGirl.define do
  factory :user do
    first_name            Faker::Name.first_name
    last_name             Faker::Name.last_name
    tel_num               Faker::PhoneNumber.subscriber_number(9)
    birth_date            Faker::Date.between(30.years.ago, 18.years.ago)
    sequence(:email)      { |n| "user#{n}@example.com" }
    password              "password"
    password_confirmation "password"
  end
end
