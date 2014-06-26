class PostImage < ActiveRecord::Base
  has_attached_file :file

  belongs_to :post
end
