class CreateJoinTableSpokenLanguageUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :spoken_languages, :users do |t|
      # t.index [:spoken_language_id, :user_id]
      # t.index [:user_id, :spoken_language_id]
    end
  end
end
