class Category < ActiveRecord::Base
  validates :name, :region_id, presence: true
end
