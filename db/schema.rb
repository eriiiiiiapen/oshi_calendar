# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_27_073905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "merchandise_id", null: false
    t.integer "amount", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchandise_id"], name: "index_bookmarks_on_merchandise_id"
    t.index ["user_id", "merchandise_id"], name: "index_bookmarks_on_user_id_and_merchandise_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "merchandise_id"
    t.index ["merchandise_id"], name: "index_categories_on_merchandise_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_users", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_users_on_category_id"
    t.index ["user_id"], name: "index_category_users_on_user_id"
  end

  create_table "merchandises", force: :cascade do |t|
    t.string "name", null: false
    t.string "content"
    t.integer "price", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_merchandises_on_name", unique: true
    t.index ["user_id"], name: "index_merchandises_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookmarks", "merchandises"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "categories", "merchandises"
  add_foreign_key "categories", "users"
  add_foreign_key "category_users", "categories"
  add_foreign_key "category_users", "users"
  add_foreign_key "merchandises", "users"
end
