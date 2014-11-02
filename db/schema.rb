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

ActiveRecord::Schema.define(version: 20141101234746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "artworks", force: true do |t|
    t.integer  "user_id"
    t.integer  "gallery_id"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "artworks", ["gallery_id"], name: "index_artworks_on_gallery_id", using: :btree
  add_index "artworks", ["user_id"], name: "index_artworks_on_user_id", using: :btree

  create_table "attachments", force: true do |t|
    t.integer  "artworks_id"
    t.integer  "user_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["artworks_id"], name: "index_attachments_on_artworks_id", using: :btree
  add_index "attachments", ["user_id"], name: "index_attachments_on_user_id", using: :btree

  create_table "galleries", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "galleries", ["user_id"], name: "index_galleries_on_user_id", using: :btree

  create_table "user_authentications", force: true do |t|
    t.integer  "user_id"
    t.integer  "provider_id"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expires_at"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_authentications", ["provider_id"], name: "index_user_authentications_on_provider_id", using: :btree
  add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree

  create_table "user_providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_providers", ["name"], name: "index_user_providers_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",              default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
