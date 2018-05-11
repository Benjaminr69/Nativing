class AddCoachToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :coach, :boolean, default: false
  end
end
