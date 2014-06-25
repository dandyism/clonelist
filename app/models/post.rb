class Post < ActiveRecord::Base
  validates :title, :description, :author_id, presence: true
end
