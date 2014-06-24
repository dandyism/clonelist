class Category < ActiveRecord::Base
  validates :name, :region_id, presence: true
  
  belongs_to :parent, class_name: "Category", foreign_key: :parent_id
  has_many :children, class_name: "Category", foreign_key: :parent_id
end
