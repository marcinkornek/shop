FactoryGirl.define do
  factory :order do
    total_price       39.99
    state             'closed'
    user
  end
end
