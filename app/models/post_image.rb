class PostImage < ActiveRecord::Base
  has_attached_file :file,
    styles: { thumbnail: "50x50>", original: "512x512>" }

  validates_attachment :file, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { less_than: 5.megabytes }

  belongs_to :post

  def url(*args)
    file.url(*args)
  end

  def filename
    file_file_name
  end
end
