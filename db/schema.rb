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

ActiveRecord::Schema.define(version: 20160401001837) do

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
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "group_message", id: false, force: :cascade do |t|
    t.integer "groups_id"
    t.integer "messages_id"
  end

  add_index "group_message", ["groups_id"], name: "index_group_message_on_groups_id"
  add_index "group_message", ["messages_id"], name: "index_group_message_on_messages_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.string   "head"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.integer  "score"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "posts", ["neighborhood_id"], name: "index_posts_on_neighborhood_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.date     "date"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "neighborhood_id"
  end

  add_index "requests", ["neighborhood_id"], name: "index_requests_on_neighborhood_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "user_group_connections", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "user_group_connections", ["group_id"], name: "index_user_group_connections_on_group_id"
  add_index "user_group_connections", ["user_id"], name: "index_user_group_connections_on_user_id"

  create_table "user_message_connections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "message_id"
  end

  add_index "user_message_connections", ["message_id"], name: "index_user_message_connections_on_message_id"
  add_index "user_message_connections", ["user_id"], name: "index_user_message_connections_on_user_id"

  create_table "user_neighborhood_connections", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "neighborhood_id"
  end

  add_index "user_neighborhood_connections", ["neighborhood_id"], name: "index_user_neighborhood_connections_on_neighborhood_id"
  add_index "user_neighborhood_connections", ["user_id"], name: "index_user_neighborhood_connections_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
    t.string   "newser_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
