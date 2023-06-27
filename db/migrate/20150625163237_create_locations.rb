class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :fullname #TODO remove name and zip later on, if not in use
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.integer :zip
      t.timestamps null: false
    end
    add_index :locations, :fullname,name: "location_name_index", length: 10
  end
end
