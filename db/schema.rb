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

ActiveRecord::Schema.define(version: 20160408212405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "circuits", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "points_id"
    t.integer  "distance"
    t.integer  "note"
    t.datetime "date"
    t.string   "description"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "circuits", ["points_id"], name: "index_circuits_on_points_id", using: :btree
  add_index "circuits", ["users_id"], name: "index_circuits_on_users_id", using: :btree

  create_table "counties", force: :cascade do |t|
    t.integer  "area_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "parcours", force: :cascade do |t|
    t.float    "distance"
    t.datetime "dateDebut"
    t.datetime "dateFin"
    t.integer  "note"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parcour_id"
  end

  add_index "points", ["parcour_id"], name: "index_points_on_parcour_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parcour_id"
  end

  add_index "tags", ["parcour_id"], name: "index_tags_on_parcour_id", using: :btree

  create_table "towns", force: :cascade do |t|
    t.integer  "county_id"
    t.string   "name"
    t.integer  "radius"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "surname"
    t.string   "phone_number"
    t.integer  "age"
    t.integer  "town_id"
    t.string   "authentication_token",   default: "", null: false
    t.integer  "circuits_id"
  end

  add_index "users", ["circuits_id"], name: "index_users_on_circuits_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "areas", "countries"
  add_foreign_key "counties", "areas"
  add_foreign_key "groups", "users"
  add_foreign_key "towns", "counties"
  add_foreign_key "users", "towns"
end
