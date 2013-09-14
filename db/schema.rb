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

ActiveRecord::Schema.define(version: 20130914211310) do

  create_table "v1_admin_companies", force: true do |t|
    t.string   "name",       null: false
    t.string   "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "v1_admin_companies", ["name"], name: "index_v1_admin_companies_on_name"

  create_table "v1_admin_users", force: true do |t|
    t.string   "name",                               null: false
    t.integer  "company_id",                         null: false
    t.boolean  "admin",              default: false, null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "v1_admin_users", ["company_id"], name: "index_v1_admin_users_on_company_id"
  add_index "v1_admin_users", ["email"], name: "index_v1_admin_users_on_email"

  create_table "v1_employees", force: true do |t|
    t.integer  "company_id", null: false
    t.string   "phone",      null: false
    t.string   "name",       null: false
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "v1_employees", ["company_id"], name: "index_v1_employees_on_company_id"
  add_index "v1_employees", ["name"], name: "index_v1_employees_on_name"
  add_index "v1_employees", ["phone"], name: "index_v1_employees_on_phone"

  create_table "v1_messages", force: true do |t|
    t.integer  "company_id",                      null: false
    t.integer  "employee_id",                     null: false
    t.integer  "question_id"
    t.string   "body",                            null: false
    t.string   "data"
    t.string   "direction",                       null: false
    t.string   "status",      default: "pending", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "v1_messages", ["company_id"], name: "index_v1_messages_on_company_id"
  add_index "v1_messages", ["employee_id"], name: "index_v1_messages_on_employee_id"
  add_index "v1_messages", ["question_id"], name: "index_v1_messages_on_question_id"

  create_table "v1_questions", force: true do |t|
    t.string   "company_id",   null: false
    t.string   "question",     null: false
    t.string   "response_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "v1_questions", ["company_id"], name: "index_v1_questions_on_company_id"
  add_index "v1_questions", ["response_tag"], name: "index_v1_questions_on_response_tag"

end
