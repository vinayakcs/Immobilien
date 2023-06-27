class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
#compose url from urltoken+firstname, for seo
      t.string :url_token
#this is for session control, a salt like token must go here (dynamic)
      t.string :remember_token
      t.string :address
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :phone
      t.boolean :isblocked, default: false

      t.attachment :profile_image
      
      t.string :location_name
#given reviews
      t.integer :reviews_count

      t.integer :deals_accepted
      t.integer :deals_rejected
      t.integer :deals_pending

      t.integer :unread_message_count

      t.timestamps null: false
    end
    add_index :clients, :url_token, name: "client_index_url_token", unique: true
  end
end
