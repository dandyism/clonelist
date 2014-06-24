class Region < ActiveRecord::Base
  acts_as_tree
  
  validates :name, presence: true
  
  has_many :direct_categories, class_name: "Category"
  
  def categories
    self_and_descendants.map(&:direct_categories).flatten
  end
end
