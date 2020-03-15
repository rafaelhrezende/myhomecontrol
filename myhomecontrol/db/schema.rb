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

ActiveRecord::Schema.define(version: 2020_03_15_180616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contexts", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contexts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "brand", limit: 50
    t.bigint "context_id"
    t.index ["context_id"], name: "index_products_on_context_id"
  end

  create_table "purchase_list_items", force: :cascade do |t|
    t.bigint "purchase_list_id", null: false
    t.bigint "product_id", null: false
    t.decimal "quantity"
    t.decimal "price"
    t.decimal "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unity", limit: 3
    t.index ["product_id"], name: "index_purchase_list_items_on_product_id"
    t.index ["purchase_list_id"], name: "index_purchase_list_items_on_purchase_list_id"
  end

  create_table "purchase_lists", force: :cascade do |t|
    t.string "name"
    t.decimal "totalprice"
    t.string "company"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "purchase_date"
    t.bigint "context_id"
    t.index ["context_id"], name: "index_purchase_lists_on_context_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "context_id"
    t.index ["context_id"], name: "index_users_on_context_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contexts", "users"
  add_foreign_key "products", "contexts"
  add_foreign_key "purchase_list_items", "products"
  add_foreign_key "purchase_list_items", "purchase_lists"
  add_foreign_key "purchase_lists", "contexts"
  add_foreign_key "users", "contexts"
end
