class Post < ActiveRecord::Base
  validates :title, :description, :author_id, presence: true
  
  belongs_to :user
end
