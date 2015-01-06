FactoryGirl.define do
  factory :product do
    name              "basic t-shirt"
    price             39.99
    composition       "100% cotton"
    images            [ Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test_pic.jpg')) ]
    category
  end
end
