class Category < ActiveRecord::Base
  validates :name, :region_id, presence: true
  
  belongs_to :parent_category, class_name: "Category", foreign_key: :parent_id
  has_many :children, -> (parent) { where region_id: parent.region_id },
    class_name: "Category", foreign_key: :parent_id
    
  belongs_to :region
end