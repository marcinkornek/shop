FactoryGirl.define do
  factory :order_detail do
    price  39.99
    amount 5
    product_size
    order
  end
end
