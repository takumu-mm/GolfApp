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

ActiveRecord::Schema[7.1].define(version: 2024_04_26_045653) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "search_keyword"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "category_videos", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_videos_on_category_id"
    t.index ["video_id"], name: "index_category_videos_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_video_id"
    t.string "title"
    t.string "channel_name"
    t.integer "view_count"
    t.integer "like_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "category_videos", "categories"
  add_foreign_key "category_videos", "videos"
end
