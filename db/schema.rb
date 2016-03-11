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

ActiveRecord::Schema.define(version: 20160305050630) do

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
    t.text     "post"
    t.integer  "score"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
  end

  add_index "posts", ["neighborhood_id"], name: "index_posts_on_neighborhood_id"

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
    t.string   "password_digest"
    t.string   "email"
    t.string   "name"
    t.integer  "isNewser"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
