class CreateMesages < ActiveRecord::Migration[5.1]
  def change
    create_table :mesages do |t|
    	t.text :body
   		t.references :conversation, index: true
   		t.references :user, index: true
   		t.boolean :read, :default => false
   		
   		t.timestamps
    end
  end
end
