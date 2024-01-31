# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_30_183629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", id: :serial, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "chats", id: :serial, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "author_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["author_id"], name: "index_chats_on_author_id"
    t.index ["event_id"], name: "index_chats_on_event_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "game_id", null: false
    t.integer "required_players", null: false
    t.text "details", null: false
    t.datetime "date", precision: nil, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "author_id", null: false
    t.integer "admin_id", null: false
    t.string "title", default: "Game Night!", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
    t.index ["author_id"], name: "index_events_on_author_id"
    t.index ["game_id"], name: "index_events_on_game_id"
    t.index ["group_id"], name: "index_events_on_group_id"
  end

  create_table "favorite_games", id: :serial, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["game_id"], name: "index_favorite_games_on_game_id"
    t.index ["user_id"], name: "index_favorite_games_on_user_id"
  end

  create_table "friends", id: :serial, force: :cascade do |t|
    t.integer "friend_1_id", null: false
    t.integer "friend_2_id", null: false
    t.boolean "pending", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["friend_1_id"], name: "index_friends_on_friend_1_id"
    t.index ["friend_2_id"], name: "index_friends_on_friend_2_id"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.string "game_name", null: false
    t.text "description", null: false
    t.boolean "video_game", null: false
    t.string "genre", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "group_members", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "pending", default: true, null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "group_name", null: false
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["admin_id"], name: "index_groups_on_admin_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "time_zone", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
