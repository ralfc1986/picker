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

ActiveRecord::Schema.define(version: 2022_09_22_152932) do

  create_table "article_categories", force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name"
  end

  create_table "days", force: :cascade do |t|
    t.integer "match_day"
    t.date "match_date"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "day_id"
    t.string "stage_code"
    t.datetime "started_at"
    t.string "home_country_code"
    t.string "away_country_code"
    t.float "home_odds"
    t.float "away_odds"
    t.float "draw_odds"
    t.string "winner"
    t.index ["day_id"], name: "index_matches_on_day_id"
  end

  create_table "outcomes", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name"
  end

  create_table "picks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "match_id"
    t.string "outcome_code"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_picks_on_match_id"
    t.index ["user_id"], name: "index_picks_on_user_id"
  end

  create_table "stages", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "weighting"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "matches", "days"
  add_foreign_key "picks", "matches"
  add_foreign_key "picks", "users"
end
