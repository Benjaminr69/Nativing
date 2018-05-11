class RemoveAvatarFromTableUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :avatar_file_name 
  	remove_column :users, :avatar_content_type
  	remove_column :users, :avatar_file_size
  	remove_column :users, :avatar_updated_at
  	remove_column :users, :spoken_language
  end
end
