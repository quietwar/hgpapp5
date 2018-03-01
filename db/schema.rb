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

ActiveRecord::Schema.define(version: 20180228223911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_admin_managed_resources", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", force: :cascade do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.integer "state", limit: 2, default: 0, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email2"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "cell"
    t.string "provider"
    t.string "uid"
    t.integer "roles_mask"
    t.string "username"
    t.boolean "superadmin"
    t.integer "utf8"
    t.integer "role", limit: 2, default: 0, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_admin_users_on_provider_and_uid", unique: true
  end

  create_table "admins", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "login"
    t.string "title"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "classroom_id", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_attendances_on_classroom_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "classrooms", id: :serial, force: :cascade do |t|
    t.string "genius"
    t.integer "cohorts"
    t.string "email"
    t.integer "cell"
    t.integer "stipend"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "meeting", null: false
    t.datetime "end_time", null: false
    t.string "subject", limit: 40, null: false
    t.integer "cohort_id"
    t.index ["cohort_id"], name: "index_classrooms_on_cohort_id"
  end

  create_table "cohorts", id: :serial, force: :cascade do |t|
    t.string "genius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_id"
    t.string "city"
    t.integer "cohort_id"
    t.string "email"
    t.string "email2"
    t.integer "stipend"
    t.string "benchmark"
    t.string "projects"
    t.bigint "cell"
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.bigint "cohort"
    t.string "name"
    t.string "section"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
  end

  create_table "events", force: :cascade do |t|
    t.string "event"
    t.integer "staff_id"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genius"
    t.integer "user_id"
    t.index ["user_id"], name: "index_features_on_user_id", unique: true
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.string "visited_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "app_name"
    t.string "coding"
    t.text "project_details"
    t.date "start_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "utf8"
    t.string "authenticity_token"
    t.string "commit"
    t.string "locale"
    t.string "github"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.string "username"
    t.boolean "superadmin", default: false, null: false
    t.string "title"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "city"
    t.integer "cohort_id"
    t.string "email2"
    t.string "projects"
    t.bigint "cell"
    t.string "app_name"
    t.string "coding"
    t.text "project_details"
    t.date "start_date"
    t.integer "user_id"
    t.string "genius"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "access_token"
    t.string "refresh_token"
    t.integer "project_id"
    t.string "project"
    t.string "feature"
    t.string "provider"
    t.string "uid"
    t.string "benchmarks"
    t.integer "stipend"
    t.string "oauth_token"
    t.string "google_oauth2"
    t.string "user"
    t.string "name"
    t.integer "roles_mask"
    t.string "github"
    t.index ["access_token"], name: "index_users_on_access_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["genius"], name: "index_users_on_genius", unique: true
    t.index ["project"], name: "index_users_on_project", unique: true
    t.index ["refresh_token"], name: "index_users_on_refresh_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "rooms", "users"
end
