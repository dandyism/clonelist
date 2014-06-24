namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    regions = make_regions
    categories = make_categories
    make_ads(regions, categories)
  end
end

def make_regions
  regions = []
  
  regions << region = Region.create!(name: "US")
  regions << subregion1 = region.children.create!(name: "Alabama")
  regions << subregion2 = region.children.create!(name: "Alaska")
  
  regions << subregion1.children.create!(name: "Auburn")
  regions << subregion1.children.create!(name: "Birmingham")
  regions << subregion1.children.create!(name: "Florence / Muscle Shoals")
  regions << subregion1.children.create!(name: "Gadsden-Anniston")
  
  regions << subregion2.children.create!(name: "Anchorage / Mat-Su")
  regions << subregion2.children.create!(name: "Fairbanks")
  regions << subregion2.children.create!(name: "Kenai Peninsula")
  regions << subregion2.children.create!(name: "Southeast Alaska")
  
  regions
end

def make_categories
  categories = []
  names = []
  
  10.times do
    names.push Faker::Commerce.department
  end
  
  names.uniq.each do |name|
    categories << Category.create!(name: name)
  end
  
  categories
end

def make_ads(regions, categories)
  regions.each do |region|
    categories.each do |category|
      20.times do
        title = Faker::Commerce.product_name
      
        ad = region.direct_ads.new(title: title)
        category.direct_ads.push ad
      
        ad.save!
      end
    end
  end
end