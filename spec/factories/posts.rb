FactoryGirl.define do
  factory :post do
    title Faker::Commerce.product_name
    description Faker::Lorem.paragraph
    author_id 1
    price Faker::Commerce.price
    location { "#{Faker::Address.city}, #{Faker::Address.state_abbr}"}
    category
  end
end
