User.create!(username: "guest", email: "guest@example.com", password: "guestpassword")
User.create!(username: "4mepieter", email: "4mepieter@example.com", password: "dummypassword")
User.create!(username: "beastrain", email: "beastrain@example.com", password: "dummypassword")

Category.create!(name: "Antiques")
Category.create!(name: "Appliances")
Category.create!(name: "Automotive")
Category.create!(name: "Books")
Category.create!(name: "Clothing")
Category.create!(name: "Collectibles")
Category.create!(name: "Computer")
Category.create!(name: "Electronics")
Category.create!(name: "Furniture")
Category.create!(name: "General")
Category.create!(name: "Household")
Category.create!(name: "Jewelry")
Category.create!(name: "Sporting")
Category.create!(name: "Tools")
Category.create!(name: "Toys and Games")
Category.create!(name: "Video Gaming")

products = [
  {
    title: "Vintage chess set great condition",
    description: "Made from real oak. Great finish and no nicks.",
    image_files: ["chess_1.jpg", "chess_2.jpg", "chess_3.jpg"]
  },

  {
    title: "Reliable truck. CHEAP",
    description: "Runs great and gets decent gas mileage. Includes fuzzy dice.",
    image_files: ["truck.jpg"]
  },

  {
    title: "Assorted clothing",
    description: "Some hand-me-downs from a great aunt that I need to get rid of.",
    image_files: ["shirt_1.jpg", "shirt_2.jpg"]
  }
]

addresses = [
  {
    address_1: "1621 Shady Goose Cove",
    city: "Rollover",
    region: "NV",
    postalcode: "89019-9779"
  },

  {
    address_1: "5292 Velvet Campus",
    city: "Port Safety",
    region: "ID",
    postalcode: "83544-9467"
  },

  {
    address_1: "9314 Silent Range",
    city: "Podunk",
    region: "NV",
    postalcode: "88909-5704"
  }
]

Category.all.each do |category|
  User.all.each do |user|
    product = products.sample.dup
    image_files = product.delete :image_files

    params = {}
    params.merge! product
    params.merge! addresses.sample
    params[:price] = rand(10..2000)
    params[:category_id] = category.id

    post = user.posts.new(params)
    image_files.each do |image_file|
      post.images.new(file: File.open("db/image_seed_data/" + image_file))
    end
    post.save!
  end
end
