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

ActiveRecord::Schema.define(version: 20150424193005) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "wagon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["wagon_id"], name: "index_comments_on_wagon_id"

  create_table "defects", force: :cascade do |t|
    t.text     "description",   null: false
    t.integer  "detail_id"
    t.integer  "wagon_id"
    t.datetime "registered_at", null: false
    t.datetime "fixed_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "defects", ["detail_id"], name: "index_defects_on_detail_id"
  add_index "defects", ["wagon_id"], name: "index_defects_on_wagon_id"

  create_table "detail_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "detail_type_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "detail_models", ["detail_type_id"], name: "index_detail_models_on_detail_type_id"

  create_table "detail_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "detail_class_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "detail_types", ["detail_class_id"], name: "index_detail_types_on_detail_class_id"

  create_table "details", force: :cascade do |t|
    t.string   "name"
    t.date     "manufactured_at"
    t.date     "repared_at"
    t.integer  "detail_model_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "details", ["detail_model_id"], name: "index_details_on_detail_model_id"

  create_table "wagons", force: :cascade do |t|
    t.string   "label",           null: false
    t.text     "description"
    t.date     "manufactured_at"
    t.date     "repared_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
  end

  add_index "wagons", ["deleted_at"], name: "index_wagons_on_deleted_at"
  add_index "wagons", ["label"], name: "index_wagons_on_label", unique: true

end
