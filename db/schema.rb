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

ActiveRecord::Schema.define(version: 20140607011402) do

  create_table "expenses", force: true do |t|
    t.integer  "project_id"
    t.date     "date"
    t.string   "category"
    t.string   "provider"
    t.float    "amount"
    t.integer  "payer_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "expense_id", null: false
  end

  add_index "expenses_users", ["expense_id", "user_id"], name: "index_expenses_users_on_expense_id_and_user_id"
  add_index "expenses_users", ["user_id", "expense_id"], name: "index_expenses_users_on_user_id_and_expense_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                               default: "", null: false
    t.string   "encrypted_password",                  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "encrypted_authentication_token"
    t.string   "encrypted_authentication_token_salt"
    t.string   "encrypted_authentication_token_iv"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["encrypted_authentication_token"], name: "index_users_on_encrypted_authentication_token", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
