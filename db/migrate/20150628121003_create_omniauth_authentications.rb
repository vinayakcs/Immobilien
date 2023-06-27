class CreateOmniauthAuthentications < ActiveRecord::Migration
  def change
    create_table :omniauth_authentications do |t|
      t.string :provider
      t.string :uid
      t.string :url
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :signup_token
      t.datetime :signupdate
      t.references :omniauthable, :polymorphic => true
      t.timestamps null: false
    end
    add_index :omniauth_authentications, [:uid, :provider], unique: true
  end
end
