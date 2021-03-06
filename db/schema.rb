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

ActiveRecord::Schema.define(version: 20180216201227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "source"
    t.string "author"
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
  end

  create_table "assets", force: :cascade do |t|
    t.bigint "currency_id"
    t.decimal "amount", precision: 25, scale: 8, default: "0.0"
    t.decimal "btc_value", precision: 25, scale: 8, default: "0.0"
    t.decimal "usd_value", precision: 25, scale: 8, default: "0.0"
    t.bigint "user_id"
    t.index ["currency_id"], name: "index_assets_on_currency_id"
    t.index ["user_id"], name: "index_assets_on_user_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "external_id"
    t.string "name"
    t.string "symbol"
    t.decimal "max_supply", precision: 25, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "last_updated"
  end

  create_table "currency_updates", force: :cascade do |t|
    t.integer "rank"
    t.decimal "price", precision: 25, scale: 8
    t.decimal "volume_24h", precision: 25, scale: 2
    t.decimal "market_cap", precision: 25, scale: 2
    t.decimal "percent_change_1h"
    t.decimal "percent_change_24h"
    t.decimal "percent_change_7d"
    t.bigint "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_supply", precision: 25, scale: 2
    t.decimal "available_supply", precision: 25, scale: 2
    t.decimal "reference_price", precision: 25, scale: 8
    t.decimal "reference_market_cap", precision: 25, scale: 2
    t.decimal "reference_max_supply", precision: 25, scale: 2
    t.index ["currency_id"], name: "index_currency_updates_on_currency_id"
  end

  create_table "tracked_currencies", force: :cascade do |t|
    t.bigint "currency_id"
    t.string "notes"
    t.bigint "user_id"
    t.index ["currency_id"], name: "index_tracked_currencies_on_currency_id"
    t.index ["user_id"], name: "index_tracked_currencies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "local_currency"
    t.string "token"
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "valuation_settings", force: :cascade do |t|
    t.string "description"
    t.integer "max_value"
    t.decimal "weight", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_valuation_settings_on_user_id"
  end

  create_table "valuations", force: :cascade do |t|
    t.bigint "tracked_currency_id"
    t.integer "value"
    t.bigint "valuation_setting_id"
    t.index ["tracked_currency_id"], name: "index_valuations_on_tracked_currency_id"
    t.index ["valuation_setting_id"], name: "index_valuations_on_valuation_setting_id"
  end

  add_foreign_key "assets", "currencies"
  add_foreign_key "assets", "users"
  add_foreign_key "currency_updates", "currencies"
  add_foreign_key "tracked_currencies", "currencies"
  add_foreign_key "tracked_currencies", "users"
  add_foreign_key "valuation_settings", "users"
  add_foreign_key "valuations", "tracked_currencies"
  add_foreign_key "valuations", "valuation_settings"
end
