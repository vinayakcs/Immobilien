class CreateLocationAssocs < ActiveRecord::Migration
  def change
    create_table :location_assocs do |t|
      t.integer :location_id
      t.integer :agent_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
