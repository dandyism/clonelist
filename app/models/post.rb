class Post < ActiveRecord::Base
  validates :title, :description, :author_id, :category, presence: true
  validates :price, numericality: true
  
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :category

  has_many :images, class_name: "PostImage"

  include PgSearch
  pg_search_scope :search_by_keywords,
                  against: [:title, :description],
                  using: {
                    tsearch: { prefix: true }
                  }

  def location
    [address_1, address_2, city, region, postalcode].compact.join(', ')
  end

  def image_urls
    images.map(&:url)
  end

  def image_thumbnail_urls
    images.map do |image|
      image.url(:thumbnail)
    end
  end
end
