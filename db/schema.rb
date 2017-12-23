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

ActiveRecord::Schema.define(version: 20171223160614) do

  create_table "advertises", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.float "rating", default: 0.0
    t.boolean "disponibility"
    t.string "description"
    t.integer "rating_count", default: 0
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_advertises_on_establishment_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "day"
    t.boolean "available"
    t.time "available_hour"
    t.time "unavailable_hour"
    t.integer "establishment_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_days_on_establishment_id"
    t.index ["product_id"], name: "index_days_on_product_id"
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "latitude"
    t.integer "longitude"
    t.float "rating", default: 0.0
    t.integer "rating_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "description"
    t.string "category"
    t.integer "quantity"
    t.integer "establishment_id"
    t.integer "combo_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["combo_id"], name: "index_products_on_combo_id"
    t.index ["establishment_id"], name: "index_products_on_establishment_id"
    t.index ["event_id"], name: "index_products_on_event_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "avaliation"
    t.integer "advertise_id"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertise_id"], name: "index_ratings_on_advertise_id"
    t.index ["establishment_id"], name: "index_ratings_on_establishment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
