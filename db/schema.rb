# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160404145708) do

  # These are extensions that must be enabled in order to support this database
  #enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string   "url_token"
    t.string   "remember_token"
    t.string   "title",                      default: "immobilien manager"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "isblocked",                  default: false
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "gender"
    t.text     "description"
    t.string   "fb_link"
    t.string   "twitter_link"
    t.string   "googleplus_link"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.boolean  "is_team",                    default: false
    t.integer  "review_score",               default: 0
    t.integer  "total_deals",                default: 0
    t.decimal  "price_min",                  default: 0.0
    t.decimal  "price_max",                  default: 0.0
    t.decimal  "price_avg",                  default: 0.0
    t.integer  "reviews_count",              default: 0
    t.integer  "unread_message_count",       default: 0
    t.integer  "impressions_count",          default: 0
    t.integer  "deals_accepted",             default: 0
    t.integer  "deals_rejected",             default: 0
    t.integer  "deals_pending",              default: 0
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "agents", ["first_name"], name: "search_agent_name_first_index", using: :btree
  add_index "agents", ["last_name"], name: "search_agent_name_last_index", using: :btree
  add_index "agents", ["url_token"], name: "agent_index_url_token", unique: true, using: :btree

  create_table "bids", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "url_token"
    t.string   "remember_token"
    t.string   "address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email"
    t.string   "phone"
    t.boolean  "isblocked",                  default: false
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "location_name"
    t.integer  "reviews_count"
    t.integer  "deals_accepted"
    t.integer  "deals_rejected"
    t.integer  "deals_pending"
    t.integer  "unread_message_count"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "clients", ["url_token"], name: "client_index_url_token", unique: true, using: :btree

  create_table "favourites", force: :cascade do |t|
    t.integer  "agent_id"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedback_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.string   "feedback_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  #add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "language_assocs", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "agent_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_assocs", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "agent_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "fullname"
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["fullname"], name: "location_name_index", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.datetime "read_at"
    t.text     "content"
    t.string   "status"
    t.boolean  "is_deal"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "messages", ["receiver_id"], name: "message_receiver_id_index", using: :btree
  add_index "messages", ["sender_id"], name: "message_sender_id_index", using: :btree

  create_table "omniauth_authentications", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.string   "signup_token"
    t.datetime "signupdate"
    t.integer  "omniauthable_id"
    t.string   "omniauthable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "omniauth_authentications", ["uid", "provider"], name: "index_omniauth_authentications_on_uid_and_provider", unique: true, using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "property_assocs", force: :cascade do |t|
    t.integer  "agent_id"
    t.integer  "client_id"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.text     "content"
    t.integer  "overall"
    t.boolean  "isreviewed"
    t.integer  "location_id"
    t.string   "purpose"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["from_user_id"], name: "index_reviews_on_from_user_id", using: :btree
  add_index "reviews", ["to_user_id"], name: "index_reviews_on_to_user_id", using: :btree

end
