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

ActiveRecord::Schema.define(version: 20160422205813) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
  end

  add_index "categories", ["neighborhood_id"], name: "index_categories_on_neighborhood_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
    t.integer  "user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "start_time"
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.string   "status"
    t.integer  "request_id"
  end

  add_index "events", ["neighborhood_id"], name: "index_events_on_neighborhood_id"
  add_index "events", ["request_id"], name: "index_events_on_request_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "group_messages", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_messages", ["group_id"], name: "index_group_messages_on_group_id"
  add_index "group_messages", ["message_id"], name: "index_group_messages_on_message_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.string   "head"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "neighborhood_leads", force: :cascade do |t|
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "neighborhood_leads", ["neighborhood_id"], name: "index_neighborhood_leads_on_neighborhood_id"

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "threshold"
    t.integer  "parent_id"
    t.string   "image_url"
  end

  add_index "neighborhoods", ["parent_id"], name: "index_neighborhoods_on_parent_id"

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.integer  "score"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
    t.string   "title"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  add_index "posts", ["neighborhood_id"], name: "index_posts_on_neighborhood_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.string   "request_type"
    t.integer  "event_id"
  end

  add_index "requests", ["event_id"], name: "index_requests_on_event_id"
  add_index "requests", ["neighborhood_id"], name: "index_requests_on_neighborhood_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id"

  create_table "user_messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "message_id"
  end

  add_index "user_messages", ["message_id"], name: "index_user_messages_on_message_id"
  add_index "user_messages", ["user_id"], name: "index_user_messages_on_user_id"

  create_table "user_neighborhood_connections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_neighborhood_connections", ["neighborhood_id"], name: "index_user_neighborhood_connections_on_neighborhood_id"
  add_index "user_neighborhood_connections", ["user_id"], name: "index_user_neighborhood_connections_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "current_neighborhood_id"
    t.integer  "score"
    t.string   "phone_number"
    t.string   "description"
    t.string   "user_type"
    t.string   "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
