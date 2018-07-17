class AddAvailabilityIdToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :availability_id, :integer
  	add_index :posts, :availability_id
  end
end
