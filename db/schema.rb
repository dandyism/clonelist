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

ActiveRecord::Schema.define(version: 20140624144950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "regions", force: true do |t|
    t.integer  "parent_id"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["parent_id"], name: "index_regions_on_parent_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "region",     null: false
    t.string   "subregion",  null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["region", "subregion", "name"], name: "index_sites_on_region_and_subregion_and_name", unique: true, using: :btree

end
