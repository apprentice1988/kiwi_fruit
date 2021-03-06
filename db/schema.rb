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

ActiveRecord::Schema.define(version: 20140602064222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "captions", force: true do |t|
    t.integer "video_id"
    t.text    "content"
    t.integer "manuscripts_count", default: 0
  end

  add_index "captions", ["video_id"], name: "index_captions_on_video_id", using: :btree

  create_table "industries", force: true do |t|
    t.string  "name"
    t.integer "videos_count", default: 0
  end

  create_table "manuscripts", force: true do |t|
    t.integer "user_id"
    t.integer "caption_id"
  end

  add_index "manuscripts", ["caption_id"], name: "index_manuscripts_on_caption_id", using: :btree
  add_index "manuscripts", ["user_id"], name: "index_manuscripts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "email"
    t.string  "avatar"
    t.string  "name"
    t.string  "password_digest"
    t.string  "remember_token"
    t.boolean "is_admin",        default: false
  end

  create_table "video_extensions", force: true do |t|
    t.string   "title"
    t.string   "ori_thumbnail_small"
    t.string   "ori_thumbnail_medium"
    t.string   "ori_thumbnail_large"
    t.string   "ori_url"
    t.string   "provider"
    t.integer  "duration"
    t.text     "dl_urls",              default: [], array: true
    t.text     "description"
    t.string   "keywords"
    t.string   "embed_url"
    t.boolean  "is_available"
    t.datetime "date"
  end

  create_table "videos", force: true do |t|
    t.string  "qiniu_urls",         default: [],    array: true
    t.string  "title"
    t.string  "thumbnail_small"
    t.string  "thumbnail_medium"
    t.string  "thumbnail_large"
    t.integer "user_id"
    t.boolean "is_published",       default: false
    t.integer "industry_id"
    t.integer "video_extension_id"
  end

  add_index "videos", ["industry_id"], name: "index_videos_on_industry_id", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree
  add_index "videos", ["video_extension_id"], name: "index_videos_on_video_extension_id", using: :btree

end
