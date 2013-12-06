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

ActiveRecord::Schema.define(version: 20131206080532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "name",            default: "", null: false
    t.string   "display_name",    default: "", null: false
    t.string   "title"
    t.string   "bio"
    t.string   "facts"
    t.string   "advice"
    t.string   "quotes"
    t.integer  "num_favorites",   default: 0,  null: false
    t.integer  "num_shares",      default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "superheroine_id"
  end

  add_index "cards", ["name"], name: "index_cards_on_name", unique: true, using: :btree
  add_index "cards", ["superheroine_id"], name: "index_cards_on_superheroine_id", using: :btree

  create_table "deck_members", force: true do |t|
    t.integer  "deck_id"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deck_members", ["deck_id"], name: "index_deck_members_on_deck_id", using: :btree

  create_table "decks", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["name"], name: "index_decks_on_name", unique: true, using: :btree

  create_table "favorite_cards", force: true do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_cards", ["user_id"], name: "index_favorite_cards_on_user_id", using: :btree

  create_table "shared_cards", force: true do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "platformType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shared_cards", ["user_id"], name: "index_shared_cards_on_user_id", using: :btree

  create_table "superheroine_powers", force: true do |t|
    t.integer  "superheroine_id"
    t.integer  "superpower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "superheroine_powers", ["superheroine_id"], name: "index_superheroine_powers_on_superheroine_id", using: :btree
  add_index "superheroine_powers", ["superpower_id"], name: "index_superheroine_powers_on_superpower_id", using: :btree

  create_table "superheroines", force: true do |t|
    t.string   "name",         default: "", null: false
    t.string   "display_name", default: "", null: false
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "superheroines", ["name"], name: "index_superheroines_on_name", unique: true, using: :btree

  create_table "superpowers", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "superpowers", ["name"], name: "index_superpowers_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
