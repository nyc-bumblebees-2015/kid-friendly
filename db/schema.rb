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

ActiveRecord::Schema.define(version: 20150812220916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
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

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "review_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",                   null: false
    t.string   "place_id",               null: false
    t.float    "lng",                    null: false
    t.float    "lat",                    null: false
    t.string   "formatted_address",      null: false
    t.string   "formatted_phone_number"
    t.boolean  "cribs"
    t.boolean  "changing_stations"
    t.boolean  "high_chairs"
    t.boolean  "family_restrooms"
    t.boolean  "restrooms"
    t.boolean  "nursing_stations"
    t.boolean  "water_fountains"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "play_areas"
    t.string   "yelp_id"
    t.string   "yelp_url"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "location_id",         null: false
    t.integer  "user_id",             null: false
    t.integer  "overall_rating",      null: false
    t.integer  "cleanliness_rating"
    t.integer  "spaciousness_rating"
    t.text     "body"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "username",                        null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
