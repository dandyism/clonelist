class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.decimal :price
      t.string :location

      t.timestamps
    end
  end
end
