class PostImage < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :post

  def url
    file.url
  end

  def filename
    file_file_name
  end
end
