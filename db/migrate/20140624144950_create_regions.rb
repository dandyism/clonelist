class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :parent_id
      t.string :name, null: false

      t.timestamps
    end
    
    add_index :regions, :parent_id
  end
end
