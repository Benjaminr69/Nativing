class AddAvailabilityIdToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :availability_id, :integer
  	add_index :users, :availability_id
  end
end
