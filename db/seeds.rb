User.create!(username: "guest", email: "guest@example.com", password: "guestpassword")
User.create!(username: "4mepieter", email: "4mepieter@example.com", password: "dummypassword")
User.create!(username: "beastrain", email: "beastrain@example.com", password: "dummypassword")
User.create!(username: "brailnet", email: "brailnet@example.com", password: "dummypassword")
User.create!(username: "burntso", email: "burntso@example.com", password: "dummypassword")
User.create!(username: "chronosfire", email: "chronosfire@example.com", password: "dummypassword")
User.create!(username: "cooladictu", email: "cooladictu@example.com", password: "dummypassword")
User.create!(username: "corabat", email: "corabat@example.com", password: "dummypassword")
User.create!(username: "dareramb", email: "dareramb@example.com", password: "dummypassword")
User.create!(username: "doodlerybo", email: "doodlerybo@example.com", password: "dummypassword")
User.create!(username: "eplamide", email: "eplamide@example.com", password: "dummypassword")
User.create!(username: "exotictith", email: "exotictith@example.com", password: "dummypassword")
User.create!(username: "fatevintage", email: "fatevintage@example.com", password: "dummypassword")
User.create!(username: "forlifecu", email: "forlifecu@example.com", password: "dummypassword")
User.create!(username: "garrica", email: "garrica@example.com", password: "dummypassword")
User.create!(username: "henryolpist", email: "henryolpist@example.com", password: "dummypassword")
User.create!(username: "inestarp", email: "inestarp@example.com", password: "dummypassword")
User.create!(username: "iwanterco", email: "iwanterco@example.com", password: "dummypassword")
User.create!(username: "japatels", email: "japatels@example.com", password: "dummypassword")
User.create!(username: "kroolormace", email: "kroolormace@example.com", password: "dummypassword")
User.create!(username: "mabelluti", email: "mabelluti@example.com", password: "dummypassword")
User.create!(username: "mincorett", email: "mincorett@example.com", password: "dummypassword")
User.create!(username: "nightwest", email: "nightwest@example.com", password: "dummypassword")
User.create!(username: "nulomber", email: "nulomber@example.com", password: "dummypassword")
User.create!(username: "phoenixonli", email: "phoenixonli@example.com", password: "dummypassword")
User.create!(username: "rhombland", email: "rhombland@example.com", password: "dummypassword")
User.create!(username: "ridaseauer", email: "ridaseauer@example.com", password: "dummypassword")
User.create!(username: "sarensemi", email: "sarensemi@example.com", password: "dummypassword")
User.create!(username: "shimagen", email: "shimagen@example.com", password: "dummypassword")
User.create!(username: "spellco", email: "spellco@example.com", password: "dummypassword")

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

Category.all.each do |category|
  User.all.each do |user|
    params = {}
    params.merge! products.sample
    params.merge! addresses.sample
    params[:price] = rand(10..2000)
    params[:category_id] = category.id

    user.posts.create!(params)
  end
end
