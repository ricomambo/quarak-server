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

ActiveRecord::Schema.define(version: 20140902140542) do

  create_table "expenses", force: true do |t|
    t.integer  "project_id"
    t.date     "date"
    t.string   "category"
    t.string   "provider"
    t.decimal  "amount"
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

  add_index "projects_users", ["project_id", "user_id"], name: "index_projects_users_on_project_id_and_user_id"
  add_index "projects_users", ["user_id", "project_id"], name: "index_projects_users_on_user_id_and_project_id"

  create_table "settlements", force: true do |t|
    t.integer  "project_id"
    t.integer  "payer_id"
    t.integer  "payee_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",      default: "", null: false
    t.string   "password",   default: "", null: false
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
