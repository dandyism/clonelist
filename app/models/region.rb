class Region < ActiveRecord::Base
  acts_as_tree
  
  validates :name, presence: true
  
  has_many :direct_ads, class_name: "Ad"
  
  def ads
    self_and_descendants.map(&:direct_ads).flatten
  end
end
