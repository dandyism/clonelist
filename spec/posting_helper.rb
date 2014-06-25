def fill_in_post_form
  fill_in 'post-title', with: Faker::Commerce.product_name
  fill_in 'post-description', with: Faker::Lorem.paragraph
  fill_in 'price', with: Faker::Commerce.price
  fill_in 'location', with: "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
end
