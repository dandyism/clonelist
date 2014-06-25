class AddNotNullToPosts < ActiveRecord::Migration
  def change
    change_column :posts, :title, :string, null: false
    change_column :posts, :description, :text, null: false
    change_column :posts, :author_id, :integer, null: false
  end
end
