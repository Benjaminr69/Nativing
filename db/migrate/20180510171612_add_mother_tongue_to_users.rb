class AddMotherTongueToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :mother_tongue, :string
  end
end
