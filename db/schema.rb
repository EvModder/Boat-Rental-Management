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

ActiveRecord::Schema.define(version: 20171023151203) do

  create_table "boat_attachments", force: :cascade do |t|
    t.integer  "boat_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boats", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "available_date"
    t.integer  "ownerid"
    t.integer  "price"
    t.text     "location"
  end

  create_table "captains", force: :cascade do |t|
    t.integer  "age",                    limit: 5
    t.integer  "year_experience",        limit: 5
    t.text     "comments",               limit: 1000
    t.date     "first_available_date"
    t.time     "monday_availability"
    t.time     "tuesday_availability"
    t.time     "wednesday_availability"
    t.time     "thurdsay_availability"
    t.time     "friday_availability"
    t.time     "saturday_availability"
    t.time     "sunday_availability"
    t.boolean  "monday",                              default: false
    t.boolean  "tuesday",                             default: false
    t.boolean  "wednesday",                           default: false
    t.boolean  "thursday",                            default: false
    t.boolean  "friday",                              default: false
    t.boolean  "saturday",                            default: false
    t.boolean  "sunday",                              default: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "first_name",                        default: "",    null: false
    t.string   "last_name"
    t.boolean  "isCaptain",                         default: false
    t.string   "address_line1",          limit: 50
    t.string   "address_line2",          limit: 50
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
