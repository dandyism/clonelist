class PostImage < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..204.kilobytes }

  belongs_to :post

  def url
    file.url
  end

  def filename
    file_file_name
  end
end
