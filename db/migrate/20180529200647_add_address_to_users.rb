class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :address, :string
  	add_column :users, :street_number, :integer
  	add_column :users, :locality, :string
  	add_column :users, :route, :string
  	add_column :users, :administrative_area_level_1, :string
  	add_column :users, :country, :string
  	add_column :users, :postal_code, :integer
  end
end
