class Post < ActiveRecord::Base
  validates :title, :description, :author_id, presence: true
  validates :price, numericality: true
  
  belongs_to :author, class_name: "User", foreign_key: :author_id
end
