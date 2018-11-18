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

ActiveRecord::Schema.define(version: 20181117174914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bookmarks_on_event_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "event_attendings", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_attendings_on_event_id"
    t.index ["user_id"], name: "index_event_attendings_on_user_id"
  end

  create_table "event_requests", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "requester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_requests_on_event_id"
    t.index ["requester_id"], name: "index_event_requests_on_requester_id"
  end

  create_table "event_waitings", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "waiter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_waitings_on_event_id"
    t.index ["waiter_id"], name: "index_event_waitings_on_waiter_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "host_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "location"
    t.float "event_longitude"
    t.float "event_latitude"
    t.string "chatlink"
    t.boolean "hosted"
    t.boolean "reviewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_longitude", "event_latitude"], name: "index_events_on_event_longitude_and_event_latitude"
    t.index ["host_id"], name: "index_events_on_host_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id", null: false
    t.integer "actor_id", null: false
    t.datetime "read_at"
    t.integer "target_id"
    t.string "target_type"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_notifications_on_actor_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.integer "age"
    t.text "description"
    t.integer "tag_id"
    t.string "address"
    t.float "profile_longitude"
    t.float "profile_latitude"
    t.boolean "isVerified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pic"
    t.index ["profile_longitude", "profile_latitude"], name: "index_profiles_on_profile_longitude_and_profile_latitude"
    t.index ["tag_id"], name: "index_profiles_on_tag_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "profiles_tags", id: false, force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "tag_id", null: false
    t.index ["profile_id", "tag_id"], name: "index_profiles_tags_on_profile_id_and_tag_id"
    t.index ["tag_id", "profile_id"], name: "index_profiles_tags_on_tag_id_and_profile_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "event_id"
    t.integer "host_id", null: false
    t.integer "author_id", null: false
    t.float "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_reviews_on_author_id"
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["host_id"], name: "index_reviews_on_host_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "profile_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_tags_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
