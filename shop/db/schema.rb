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

ActiveRecord::Schema.define(version: 20150917210227) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "telephone"
  end

  add_index "customers", ["user_id", "created_at"], name: "index_customers_on_user_id_and_created_at"
  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "goods", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.string   "description"
    t.integer  "how_many"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  add_index "goods", ["category_id", "created_at"], name: "index_goods_on_category_id_and_created_at"
  add_index "goods", ["category_id"], name: "index_goods_on_category_id"
  add_index "goods", ["user_id", "created_at"], name: "index_goods_on_user_id_and_created_at"
  add_index "goods", ["user_id"], name: "index_goods_on_user_id"

  create_table "sellers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.string   "account_number"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_post_code"
    t.string   "company_city"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "telephone"
    t.string   "company_number"
  end

  add_index "sellers", ["user_id", "created_at"], name: "index_sellers_on_user_id_and_created_at"
  add_index "sellers", ["user_id"], name: "index_sellers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "account_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
