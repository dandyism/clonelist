namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_regions
    make_categories
  end
end

def make_regions
  region = Region.create!(name: "US")
  subregion1 = region.children.create!(name: "Alabama")
  subregion2 = region.children.create!(name: "Alaska")
  
  subregion1.children.create!(name: "Auburn")
  subregion1.children.create!(name: "Birmingham")
  subregion1.children.create!(name: "Florence / Muscle Shoals")
  subregion1.children.create!(name: "Gadsden-Anniston")
  
  subregion2.children.create!(name: "Anchorage / Mat-Su")
  subregion2.children.create!(name: "Fairbanks")
  subregion2.children.create!(name: "Kenai Peninsula")
  subregion2.children.create!(name: "Southeast Alaska")
end

def make_categories
  names = []
  
  10.times do
    names.push Faker::Commerce.department
  end
  
  names.uniq.each do |name|
    Category.create!(name: name)
  end
end