class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
#compose url from urltoken+firstname, for seo
      t.string :url_token
#this is for session control, a salt like token must go here (dynamic)
      t.string :remember_token
#title of the page      
      t.string :title, default: "immobilien manager"
      t.string :first_name
      t.string :last_name
      t.boolean :isblocked, default: false

      t.string :email
      t.string :phone
      t.text   :address
      t.string :gender

#about agent
      t.text :description
#social campaign options
      t.string :fb_link
      t.string :twitter_link
      t.string :googleplus_link

      t.attachment :profile_image
#for icon, whether solo or team
      t.boolean :is_team, default: false
#overall review score
      t.integer :review_score, default: 0
#deals concluded and in progress
      t.integer :total_deals, default: 0

      t.decimal :price_min, default: 0
      t.decimal :price_max, default: 0
      t.decimal :price_avg, default: 0

      t.integer :reviews_count, default: 0

      t.integer :unread_message_count, default: 0
#for views
      t.integer :impressions_count, default: 0

      t.integer :deals_accepted, default: 0
      t.integer :deals_rejected, default: 0
      t.integer :deals_pending, default: 0

      t.timestamps null: false
    end
    add_index :agents, :first_name,name: "search_agent_name_first_index", length: 10
    add_index :agents, :last_name,name: "search_agent_name_last_index", length: 10
    add_index :agents, :url_token, name: "agent_index_url_token", unique: true
  end
end
