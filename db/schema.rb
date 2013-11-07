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
ActiveRecord::Schema.define(version: 20131107030651) do

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

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.string   "cname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "outsider_id"
    t.integer  "insider_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["insider_id"], name: "index_comments_on_insider_id", using: :btree
  add_index "comments", ["outsider_id"], name: "index_comments_on_outsider_id", using: :btree

  create_table "conversations", force: true do |t|
    t.string   "topic"
    t.integer  "insider_id"
    t.integer  "outsider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "conversations", ["insider_id"], name: "index_conversations_on_insider_id", using: :btree
  add_index "conversations", ["outsider_id"], name: "index_conversations_on_outsider_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: true do |t|
    t.integer  "users_id"
    t.integer  "organizations_id"
    t.boolean  "valid"
    t.boolean  "admin"
    t.boolean  "owner"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "memberships", ["organizations_id"], name: "index_memberships_on_organizations_id", using: :btree
  add_index "memberships", ["users_id"], name: "index_memberships_on_users_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "status"
    t.string   "location"
    t.string   "ip"
    t.string   "type"
    t.string   "referrer"
    t.string   "authentication_token"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_languages", force: true do |t|
    t.integer "user_id"
    t.integer "language_id"
  end

  create_table "visitors", force: true do |t|
    t.string   "fb_uid"
    t.string   "channel"
    t.integer  "missionhub_id"
    t.integer  "campaign_id"
    t.string   "locale"
    t.text     "answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
