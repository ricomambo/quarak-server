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

ActiveRecord::Schema.define(version: 20131016202434) do

  create_table "expenses", force: true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "provider"
    t.text     "comments"
    t.decimal  "amount"
    t.date     "date"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["member_id"], name: "index_expenses_on_member_id"

  create_table "expenses_members", id: false, force: true do |t|
    t.integer "expense_id", null: false
    t.integer "member_id",  null: false
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
