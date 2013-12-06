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

ActiveRecord::Schema.define(version: 20131206015702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "name",          default: "", null: false
    t.string   "display_name",  default: "", null: false
    t.string   "title"
    t.string   "bio"
    t.string   "facts"
    t.string   "advice"
    t.string   "quotes"
    t.integer  "num_favorites", default: 0,  null: false
    t.integer  "num_shares",    default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["name"], name: "index_cards_on_name", unique: true, using: :btree

  create_table "decks", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["name"], name: "index_decks_on_name", unique: true, using: :btree

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
