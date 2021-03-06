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

ActiveRecord::Schema.define(version: 20160302155525) do

  create_table "common_codes", force: :cascade do |t|
    t.string   "main_code"
    t.integer  "detail_code"
    t.string   "detail_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "designer_auths", force: :cascade do |t|
    t.integer  "designer_id"
    t.text     "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "designer_auths", ["designer_id"], name: "index_designer_auths_on_designer_id"

  create_table "designers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"

  create_table "procedure_categories", force: :cascade do |t|
    t.integer  "procedure_id"
    t.integer  "gender_id"
    t.integer  "length_id"
    t.integer  "category_id"
    t.integer  "category_detail_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "procedure_categories", ["procedure_id"], name: "index_procedure_categories_on_procedure_id"

  create_table "procedure_details", force: :cascade do |t|
    t.integer  "procedure_category_id"
    t.text     "content"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "procedure_details", ["procedure_category_id"], name: "index_procedure_details_on_procedure_category_id"

  create_table "procedures", force: :cascade do |t|
    t.integer  "designer_id"
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "procedures", ["designer_id"], name: "index_procedures_on_designer_id"

end
