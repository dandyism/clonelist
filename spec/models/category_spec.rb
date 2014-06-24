require 'rails_helper'

RSpec.describe Category, :type => :model do
  
  it "should give child categories the same region id" do
    category = Category.new(name: "for sale", region_id: 1)
    subcategory = category.children.new(name: "appliances")
    expect(subcategory.region_id).to eq category.region_id
  end
  
end
