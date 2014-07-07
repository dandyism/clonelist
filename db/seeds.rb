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
    description: "Made from real oak. Great finish and no nicks."
  },

  {
    title: "Relable truck. CHEAP",
    description: "Runs great and gets decent gas mileage. Includes fuzzy dice."
  },

  {
    title: "Assorted clothing",
    description: "Some hand-me-downs from a great aunt that I need to get rid of."
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

pwd = Dir.pwd
Dir.chdir("db/image_seed_data")
images = Dir.glob("*.jpg").map { |image| Dir.pwd + "/" + image }
Dir.chdir(pwd)

Category.all.each do |category|
  User.all.each do |user|
    params = {}
    params.merge! products.sample
    params.merge! addresses.sample
    params[:price] = rand(10..2000)
    params[:category_id] = category.id

    post = user.posts.new(params)
    post.images.new(file: File.open(images.sample))
    post.save!
  end
end
