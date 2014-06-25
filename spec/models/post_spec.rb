require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it "should require a title" do
    expect(FactoryGirl.build(:post, title: nil)).not_to be_valid
  end
  
  it "should require a description" do
    expect(FactoryGirl.build(:post, description: nil)).not_to be_valid
  end
  
  it "should require an author" do
    expect(FactoryGirl.build(:post, author_id: nil)).not_to be_valid
  end
  
  it "should require that price is a decimal" do
    expect(FactoryGirl.build(:post, price: "string")).not_to be_valid
  end

  it "should require a category" do
    expect(FactoryGirl.build(:post, category: nil)).not_to be_valid
  end
end
