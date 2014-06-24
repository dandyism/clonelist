class Region < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :parent_regions, class_name: "Region", foreign_key: :parent_id
  has_many :child_regions, class_name: "Region", foreign_key: :parent_id
end
