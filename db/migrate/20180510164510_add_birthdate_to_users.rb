class AddBirthdateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthdate, :datetime
  end
end
