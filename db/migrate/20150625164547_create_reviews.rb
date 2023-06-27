class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :from_user, index: true
      t.belongs_to :to_user, index: true
      t.text :content
      t.integer :overall
      t.boolean :isreviewed
      t.integer :location_id
      t.string :purpose

      t.timestamps null: false
    end
  end
end
