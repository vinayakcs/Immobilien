class CreateLanguageAssocs < ActiveRecord::Migration
  def change
    create_table :language_assocs do |t|
      t.integer :language_id
      t.integer :agent_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
