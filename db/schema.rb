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

ActiveRecord::Schema.define(version: 20160614132701) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "tile_image"
    t.integer  "studies_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.string "logo"
    t.string "description"
  end

  create_table "studies", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "author_id"
    t.string   "title"
    t.string   "summary"
    t.text     "body"
    t.string   "carousel_image"
    t.boolean  "in_carousel",            default: false, null: false
    t.string   "state",                                  null: false
    t.string   "github_url"
    t.datetime "last_edit_at"
    t.datetime "submited_for_review_at"
    t.datetime "accepted_at"
    t.datetime "rejected_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["author_id"], name: "index_studies_on_author_id"
    t.index ["category_id"], name: "index_studies_on_category_id"
  end

  create_table "tinymce_uploads", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",               default: false, null: false
    t.string   "name",                                   null: false
    t.string   "title",                  default: "",    null: false
    t.string   "avatar"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
