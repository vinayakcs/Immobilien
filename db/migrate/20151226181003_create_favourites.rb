class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :agent_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
