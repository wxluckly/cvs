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

ActiveRecord::Schema.define(version: 20140923153828) do

  create_table "banners", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindeditor_assets", force: true do |t|
    t.string   "asset"
    t.integer  "file_size"
    t.string   "file_type"
    t.integer  "owner_id"
    t.string   "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "banner_id"
    t.string   "page_type"
    t.string   "target_page"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover"
    t.string   "desc"
    t.integer  "product_id"
  end

  create_table "products", force: true do |t|
    t.string   "sku"
    t.string   "price"
    t.string   "weight"
    t.string   "dimensions"
    t.text     "summary"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffers", force: true do |t|
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

  add_index "staffers", ["email"], name: "index_staffers_on_email", unique: true, using: :btree
  add_index "staffers", ["reset_password_token"], name: "index_staffers_on_reset_password_token", unique: true, using: :btree

end
