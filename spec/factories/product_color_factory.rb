FactoryGirl.define do
  factory :product_color do
    color             'blue'
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test_color.jpg')) }
    images            [ Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test_pic.jpg')) ]
    product
  end
end
