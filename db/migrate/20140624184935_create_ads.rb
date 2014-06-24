class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location
      t.integer :region_id
      t.integer :category_id

      t.timestamps
    end
    
    add_index :ads, [:region_id, :category_id]
  end
end
