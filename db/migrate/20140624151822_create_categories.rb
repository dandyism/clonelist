class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name, null: false
      t.integer :region_id, null: false

      t.timestamps
    end
    
    add_index :categories, :region_id
    add_index :categories, :parent_id
  end
end
