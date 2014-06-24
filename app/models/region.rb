class Region < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :parent, class_name: "Region", foreign_key: :parent_id
  has_many :children, class_name: "Region", foreign_key: :parent_id
end
