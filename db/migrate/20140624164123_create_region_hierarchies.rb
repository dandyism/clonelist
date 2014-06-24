class CreateRegionHierarchies < ActiveRecord::Migration
  def change
    create_table :region_hierarchies do |t|
      t.integer  :ancestor_id, :null => false
      t.integer  :descendant_id, :null => false
      t.integer  :generations, :null => false
    end
    
    add_index :region_hierarchies, [:ancestor_id, :descendant_id, :generations],
      :unique => true, :name => "region_anc_desc_idx"

    add_index :region_hierarchies, [:descendant_id],
      :name => "region_desc_idx"
  end
end
