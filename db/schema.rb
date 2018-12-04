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

ActiveRecord::Schema.define(version: 2018_11_26_024720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "city_name", null: false
    t.bigint "countries_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "datetime", null: false
    t.bigint "user_id", null: false
    t.bigint "fragment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragment_id"], name: "index_comments_on_fragment_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fragments", force: :cascade do |t|
    t.string "title", null: false
    t.text "introduction", null: false
    t.text "content", null: false
    t.integer "score"
    t.string "source", null: false
    t.bigint "users_id", null: false
    t.bigint "photos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_fragments_on_users_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "follower", null: false
    t.bigint "followed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_comments", force: :cascade do |t|
    t.bigint "comments_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comments_id"], name: "index_like_comments_on_comments_id"
    t.index ["users_id"], name: "index_like_comments_on_users_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.text "base64_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "fragments_id", null: false
    t.bigint "reaction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragments_id"], name: "index_reactions_on_fragments_id"
    t.index ["users_id"], name: "index_reactions_on_users_id"
  end

  create_table "rel_fragment_sub_topics", force: :cascade do |t|
    t.bigint "fragments_id", null: false
    t.bigint "sub_topics_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragments_id"], name: "index_rel_fragment_sub_topics_on_fragments_id"
    t.index ["sub_topics_id"], name: "index_rel_fragment_sub_topics_on_sub_topics_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "datetime", null: false
    t.bigint "comments_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comments_id"], name: "index_responses_on_comments_id"
    t.index ["users_id"], name: "index_responses_on_users_id"
  end

  create_table "sub_topics", force: :cascade do |t|
    t.string "sub_topic_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_topics_topics", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "sub_topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_topic_id"], name: "index_sub_topics_topics_on_sub_topic_id"
    t.index ["topic_id"], name: "index_sub_topics_topics_on_topic_id"
  end

  create_table "sub_topics_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sub_topic_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_topic_id"], name: "index_sub_topics_users_on_sub_topic_id"
    t.index ["user_id"], name: "index_sub_topics_users_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic_name", null: false
    t.integer "score"
    t.bigint "photos_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photos_id"], name: "index_topics_on_photos_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.bigint "city_id", null: false
    t.string "score"
    t.string "talk_to_us"
    t.bigint "photos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "cities", "countries", column: "countries_id"
  add_foreign_key "comments", "fragments"
  add_foreign_key "comments", "users"
  add_foreign_key "fragments", "photos", column: "photos_id"
  add_foreign_key "fragments", "users", column: "users_id"
  add_foreign_key "friends", "users", column: "followed"
  add_foreign_key "friends", "users", column: "follower"
  add_foreign_key "like_comments", "comments", column: "comments_id"
  add_foreign_key "like_comments", "users", column: "users_id"
  add_foreign_key "reactions", "fragments", column: "fragments_id"
  add_foreign_key "reactions", "users", column: "users_id"
  add_foreign_key "rel_fragment_sub_topics", "fragments", column: "fragments_id"
  add_foreign_key "rel_fragment_sub_topics", "sub_topics", column: "sub_topics_id"
  add_foreign_key "responses", "comments", column: "comments_id"
  add_foreign_key "responses", "users", column: "users_id"
  add_foreign_key "topics", "photos", column: "photos_id"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "photos", column: "photos_id"
end
