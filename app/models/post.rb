class Post < ActiveRecord::Base
  validates :title, :description, :author_id, presence: true
  validates :price, numericality: true
  
  belongs_to :user
end
