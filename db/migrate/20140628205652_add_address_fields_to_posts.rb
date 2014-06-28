class AddAddressFieldsToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :location
    
    add_column :posts, :address_1,  :string
    add_column :posts, :address_2,  :string
    add_column :posts, :city,       :string
    add_column :posts, :region,     :string
    add_column :posts, :postalcode, :string
  end

  def down
    add_column :posts, :location,   :string
    
    remove_column :posts, :address_1
    remove_column :posts, :address_2
    remove_column :posts, :city
    remove_column :posts, :region
    remove_column :posts, :postalcode
  end
end
