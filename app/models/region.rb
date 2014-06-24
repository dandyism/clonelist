class Region < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :parent_region, class_name: "Region", foreign_key: :parent_id
  has_many :subregions, class_name: "Region", foreign_key: :parent_id
  
  has_many :categories
end
