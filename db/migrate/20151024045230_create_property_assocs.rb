class CreatePropertyAssocs < ActiveRecord::Migration
  def change
    create_table :property_assocs do |t|
      t.integer :agent_id
      t.integer :client_id
      t.integer :property_id

      t.timestamps null: false
    end
  end
end
