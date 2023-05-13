# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_10_190334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "region"
    t.integer "postal_code"
    t.integer "mobile"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "shopping_cart_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["shopping_cart_id"], name: "index_cart_items_on_shopping_cart_id"
  end

  create_table "cloth_sizes", force: :cascade do |t|
    t.string "abbrv"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cloth_sizes_on_product_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_order_details_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "order_detail_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_detail_id"], name: "index_order_items_on_order_detail_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.decimal "amount"
    t.string "provider"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_detail_id", null: false
    t.index ["order_detail_id"], name: "index_payment_details_on_order_detail_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.string "images"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_inventories", force: :cascade do |t|
    t.integer "quantity"
    t.string "sku"
    t.decimal "price"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_inventories_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "grip_size"
    t.string "head_size"
    t.decimal "rating"
    t.string "length"
    t.string "weight"
    t.string "swing_weight"
    t.string "stiffness"
    t.string "composition"
    t.text "description"
    t.decimal "price"
    t.string "sku"
    t.string "image"
    t.bigint "product_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gender_id"
    t.bigint "level_id"
    t.string "strung"
    t.string "colour"
    t.string "size"
    t.string "tension"
    t.index ["gender_id"], name: "index_products_on_gender_id"
    t.index ["level_id"], name: "index_products_on_level_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "shoe_sizes", force: :cascade do |t|
    t.string "abbrv"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shoe_sizes_on_product_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "abbrv"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sizes_on_product_id"
  end

  create_table "user_payments", force: :cascade do |t|
    t.string "payment_type"
    t.string "provider"
    t.integer "account_no"
    t.date "expiry"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "phone_no"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "shopping_carts"
  add_foreign_key "cloth_sizes", "products"
  add_foreign_key "order_details", "users"
  add_foreign_key "order_items", "order_details"
  add_foreign_key "order_items", "products"
  add_foreign_key "payment_details", "order_details"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_inventories", "products"
  add_foreign_key "products", "genders"
  add_foreign_key "products", "levels"
  add_foreign_key "products", "product_categories"
  add_foreign_key "shoe_sizes", "products"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "sizes", "products"
  add_foreign_key "user_payments", "users"
end
