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

ActiveRecord::Schema.define(version: 20180202001905) do

  create_table "advertises", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.float "rating", default: 0.0
    t.boolean "disponibility", default: true
    t.string "description"
    t.integer "rating_count", default: 0
    t.integer "category_id"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_advertises_on_category_id"
    t.index ["establishment_id"], name: "index_advertises_on_establishment_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.float "rating", default: 0.0
    t.integer "rating_count", default: 0
    t.integer "advertise_id"
    t.integer "category_id"
    t.integer "day_id"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertise_id"], name: "index_combos_on_advertise_id"
    t.index ["category_id"], name: "index_combos_on_category_id"
    t.index ["day_id"], name: "index_combos_on_day_id"
    t.index ["establishment_id"], name: "index_combos_on_establishment_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "phone"
    t.boolean "cellphone"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_contacts_on_establishment_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.boolean "available", default: false
    t.datetime "available_hour"
    t.datetime "unavailable_hour"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_days_on_establishment_id"
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.integer "number"
    t.string "complement"
    t.integer "latitude"
    t.integer "longitude"
    t.integer "area"
    t.integer "capacity"
    t.float "rating", default: 0.0
    t.integer "rating_count", default: 0
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_establishments_on_category_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price_cents", default: 0
    t.float "rating", default: 0.0
    t.integer "rating_count", default: 0
    t.integer "category_id"
    t.integer "combo_id"
    t.integer "day_id"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["combo_id"], name: "index_events_on_combo_id"
    t.index ["day_id"], name: "index_events_on_day_id"
    t.index ["establishment_id"], name: "index_events_on_establishment_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "description"
    t.boolean "accepted"
    t.string "invite_type"
    t.integer "establishment_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_invites_on_establishment_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.integer "current_value"
    t.float "discount", default: 0.0
    t.datetime "opening"
    t.datetime "expiration"
    t.boolean "expired"
    t.float "fixed_value"
    t.integer "initial_value"
    t.string "name"
    t.integer "per_users"
    t.integer "combo_id"
    t.integer "establishment_id"
    t.integer "events_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["combo_id"], name: "index_lists_on_combo_id"
    t.index ["establishment_id"], name: "index_lists_on_establishment_id"
    t.index ["events_id"], name: "index_lists_on_events_id"
    t.index ["product_id"], name: "index_lists_on_product_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "day_id"
    t.integer "product_id"
    t.integer "combo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["combo_id"], name: "index_menus_on_combo_id"
    t.index ["day_id"], name: "index_menus_on_day_id"
    t.index ["product_id"], name: "index_menus_on_product_id"
  end

  create_table "owners", force: :cascade do |t|
    t.integer "user_id"
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_owners_on_establishment_id"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "parkings", force: :cascade do |t|
    t.integer "quantity"
    t.time "open_hour"
    t.time "closure_hour"
    t.integer "hour_price_cents"
    t.boolean "free"
    t.float "rating", default: 0.0
    t.integer "rating_count", default: 0
    t.integer "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_parkings_on_establishment_id", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents", default: 0
    t.string "description"
    t.integer "quantity", default: 0
    t.float "rating", default: 0.0
    t.integer "rating_count", default: 0
    t.integer "advertise_id"
    t.integer "category_id"
    t.integer "establishment_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertise_id"], name: "index_products_on_advertise_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["establishment_id"], name: "index_products_on_establishment_id"
    t.index ["event_id"], name: "index_products_on_event_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "avaliation"
    t.string "description"
    t.string "owner"
    t.integer "owner_id"
    t.integer "advertise_id"
    t.integer "combo_id"
    t.integer "establishment_id"
    t.integer "event_id"
    t.integer "parking_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertise_id"], name: "index_ratings_on_advertise_id"
    t.index ["combo_id"], name: "index_ratings_on_combo_id"
    t.index ["establishment_id"], name: "index_ratings_on_establishment_id"
    t.index ["event_id"], name: "index_ratings_on_event_id"
    t.index ["parking_id"], name: "index_ratings_on_parking_id"
    t.index ["product_id"], name: "index_ratings_on_product_id"
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
