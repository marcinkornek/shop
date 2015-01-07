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

ActiveRecord::Schema.define(version: 20150107071238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "tel_num"
    t.string   "street"
    t.string   "house_num"
    t.string   "town"
    t.string   "postcode"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "category_type_id"
  end

  add_index "categories", ["category_type_id", "name"], name: "index_categories_on_category_type_id_and_name", unique: true, using: :btree

  create_table "category_types", force: true do |t|
    t.string  "name"
    t.integer "main_category_id"
  end

  add_index "category_types", ["main_category_id", "name"], name: "index_category_types_on_main_category_id_and_name", unique: true, using: :btree

  create_table "main_categories", force: true do |t|
    t.string "name"
    t.string "image"
  end

  add_index "main_categories", ["name"], name: "index_main_categories_on_name", unique: true, using: :btree

  create_table "product_colors", force: true do |t|
    t.string   "color"
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "images"
  end

  create_table "product_sizes", force: true do |t|
    t.string   "size"
    t.string   "quantity"
    t.integer  "product_color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "code",        null: false
    t.decimal  "price"
    t.string   "composition"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["code"], name: "index_products_on_code", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "tel_num"
    t.date     "birth_date"
    t.string   "role",                            default: "user"
    t.text     "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password",                                 null: false
    t.string   "salt",                                             null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
