class AddReferenceToCategoriesInPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer, null: false
  end
end
