def fill_in_post_form
  select('test category', from: 'category')
  fill_in 'post-title', with: Faker::Commerce.product_name
  fill_in 'post-description', with: Faker::Lorem.paragraph
  fill_in 'price', with: Faker::Commerce.price
  fill_in 'location', with: "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
end

def fill_in_signup_form
  fill_in 'Email', with: Faker::Internet.email

  password = Faker::Internet.password
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
end
