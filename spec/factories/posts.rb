FactoryGirl.define do
  factory :post do
    title Faker::Commerce.product_name
    description Faker::Lorem.paragraph
    author_id 1
  end
end