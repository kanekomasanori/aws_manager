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

ActiveRecord::Schema.define(version: 20150303003741) do

  create_table "account_regions", force: :cascade do |t|
    t.integer  "account_id",  limit: 4
    t.integer  "region_code", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "user_arn",          limit: 255, null: false
    t.string   "user_name",         limit: 255, null: false
    t.string   "access_key_id",     limit: 255, null: false
    t.string   "secret_access_key", limit: 255, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "servers", force: :cascade do |t|
    t.integer  "account_id",  limit: 4
    t.string   "instance_id", limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "shutdown",    limit: 1,   default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
