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

ActiveRecord::Schema.define(version: 20131217212830) do

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

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.string   "cname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "missionhub_secret"
    t.string   "code"
  end

  add_index "campaigns", ["code"], name: "index_campaigns_on_code", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "outsider_id"
    t.integer  "operator_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["operator_id"], name: "index_comments_on_operator_id", using: :btree
  add_index "comments", ["outsider_id"], name: "index_comments_on_outsider_id", using: :btree

  create_table "conversations", force: true do |t|
    t.string   "topic"
    t.integer  "operator_id"
    t.integer  "visitor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "channel"
  end

  add_index "conversations", ["operator_id"], name: "index_conversations_on_operator_id", using: :btree
  add_index "conversations", ["visitor_id"], name: "index_conversations_on_visitor_id", using: :btree

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
    t.string   "email",                default: "", null: false
    t.integer  "sign_in_count",        default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
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
    t.string   "refresh_token"
    t.datetime "token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "users_languages", force: true do |t|
    t.integer "user_id"
    t.integer "language_id"
  end

  create_table "visitors", force: true do |t|
    t.string   "fb_uid"
    t.integer  "missionhub_id"
    t.integer  "last_campaign_id"
    t.string   "locale"
    t.text     "answers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fb_username"
    t.string   "gender"
    t.string   "fb_access_token"
    t.string   "fb_refresh_token"
  end

  add_index "visitors", ["last_campaign_id"], name: "index_visitors_on_last_campaign_id", using: :btree
  add_index "visitors", ["missionhub_id"], name: "index_visitors_on_missionhub_id", using: :btree

end
