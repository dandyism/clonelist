class Category < ActiveRecord::Base
  acts_as_tree
  
  validates :name, presence: true
end