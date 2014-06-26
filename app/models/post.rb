class Post < ActiveRecord::Base
  validates :title, :description, :author_id, :category, presence: true
  validates :price, numericality: true
  
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :category

  has_many :images, class_name: "PostImage"
end
