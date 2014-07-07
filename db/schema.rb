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

ActiveRecord::Schema.define(version: 20140707181158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "addressable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_type"
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_restaurants", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "restaurant_id"
  end

  add_index "categories_restaurants", ["category_id"], name: "index_categories_restaurants_on_category_id", using: :btree
  add_index "categories_restaurants", ["restaurant_id"], name: "index_categories_restaurants_on_restaurant_id", using: :btree

  create_table "categorizations", force: true do |t|
    t.integer  "category_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["restaurant_id"], name: "index_categorizations_on_restaurant_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree

  create_table "recommendation_groups", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.text     "description"
  end

  add_index "recommendation_groups", ["source_id"], name: "index_recommendation_groups_on_source_id", using: :btree

  create_table "recommendations", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recommendation_group_id"
  end

  add_index "recommendations", ["recommendation_group_id"], name: "index_recommendations_on_recommendation_group_id", using: :btree
  add_index "recommendations", ["restaurant_id"], name: "index_recommendations_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recommendations_count", default: 0
    t.string   "website"
    t.integer  "sources_list",          default: [], array: true
    t.string   "categories_list",       default: [], array: true
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "user_preferences", force: true do |t|
    t.integer  "user_id"
    t.integer  "no_show_sources",     default: [], array: true
    t.integer  "no_show_restaurants", default: [], array: true
    t.integer  "tried_restaurants",   default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_preferences", ["user_id"], name: "index_user_preferences_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
