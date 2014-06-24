class RemoveRegionIdFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :region_id
  end
end
