require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "should require a title" do
    expect(FactoryGirl.build(:post, title: nil)).not_to be_valid
  end
  
  it "should require a description" do
    expect(FactoryGirl.build(:post, description: nil)).not_to be_valid
  end
  
  it "should require an author" do
    expect(FactoryGirl.build(:post, author_id: nil)).not_to be_valid
  end
end
