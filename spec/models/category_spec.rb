require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "should require a name" do
    expect(FactoryGirl.build(:category, name: nil)).not_to be_valid
  end

  it "should enforce name uniqueness" do
    FactoryGirl.create(:category, name: "Duplicate")
    expect(FactoryGirl.build(:category, name: "Duplicate")).not_to be_valid
  end
end
