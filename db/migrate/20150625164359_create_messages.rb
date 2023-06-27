class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :sender_type
      t.integer :receiver_id
      t.string :receiver_type
      t.datetime   :read_at
      t.text :content
      t.string :status
      t.boolean :is_deal

      t.timestamps null: false
    end
    add_index :messages, :sender_id,name: "message_sender_id_index", length: 10
    add_index :messages, :receiver_id,name: "message_receiver_id_index", length: 10
  end
end
