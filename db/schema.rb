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

ActiveRecord::Schema.define(version: 20220216025633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id", using: :btree
    t.index ["user_id"], name: "index_attendees_on_user_id", using: :btree
  end

  create_table "chats", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.integer  "author_id",  null: false
    t.text     "comment",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_chats_on_author_id", using: :btree
    t.index ["event_id"], name: "index_chats_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "group_id",                                 null: false
    t.integer  "game_id",                                  null: false
    t.integer  "required_players",                         null: false
    t.text     "details",                                  null: false
    t.datetime "date",                                     null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "author_id",                                null: false
    t.integer  "admin_id",                                 null: false
    t.string   "title",            default: "Game Night!", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id", using: :btree
    t.index ["author_id"], name: "index_events_on_author_id", using: :btree
    t.index ["game_id"], name: "index_events_on_game_id", using: :btree
    t.index ["group_id"], name: "index_events_on_group_id", using: :btree
  end

  create_table "favorite_games", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_favorite_games_on_game_id", using: :btree
    t.index ["user_id"], name: "index_favorite_games_on_user_id", using: :btree
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "friend_1_id",                null: false
    t.integer  "friend_2_id",                null: false
    t.boolean  "pending",     default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["friend_1_id"], name: "index_friends_on_friend_1_id", using: :btree
    t.index ["friend_2_id"], name: "index_friends_on_friend_2_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "game_name",   null: false
    t.text     "description", null: false
    t.boolean  "video_game",  null: false
    t.string   "genre",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "group_id",                  null: false
    t.integer  "user_id",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "pending",    default: true, null: false
    t.index ["group_id"], name: "index_group_members_on_group_id", using: :btree
    t.index ["user_id"], name: "index_group_members_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "admin_id",    null: false
    t.string   "group_name",  null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["admin_id"], name: "index_groups_on_admin_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "time_zone",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
