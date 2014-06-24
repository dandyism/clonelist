class Category < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :parent_category, class_name: "Category", foreign_key: :parent_id
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id
end