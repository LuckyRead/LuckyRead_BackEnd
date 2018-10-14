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

ActiveRecord::Schema.define(version: 2018_10_05_214127) do

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "city_name", null: false
    t.bigint "countries_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["countries_id"], name: "fk_rails_fc7d463229"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "datetime", null: false
    t.bigint "user_id", null: false
    t.bigint "fragment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragment_id"], name: "index_comments_on_fragment_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "country_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fragments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "introduction", null: false
    t.text "content", null: false
    t.integer "score"
    t.string "source", null: false
    t.bigint "users_id", null: false
    t.bigint "photos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photos_id"], name: "fk_rails_c155e003fa"
    t.index ["users_id"], name: "index_fragments_on_users_id"
  end

  create_table "friends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "follower", null: false
    t.bigint "followed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed"], name: "fk_rails_bf0506dcdb"
    t.index ["follower"], name: "fk_rails_70299d7edb"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sub_topic_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_topic_id"], name: "index_preferences_on_sub_topic_id"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "reactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "fragments_id", null: false
    t.string "reaction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragments_id"], name: "index_reactions_on_fragments_id"
    t.index ["users_id"], name: "index_reactions_on_users_id"
  end

  create_table "rel_fragment_sub_topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "fragments_id", null: false
    t.bigint "sub_topics_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fragments_id"], name: "index_rel_fragment_sub_topics_on_fragments_id"
    t.index ["sub_topics_id"], name: "index_rel_fragment_sub_topics_on_sub_topics_id"
  end

  create_table "rel_topic_sub_topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "topics_id", null: false
    t.bigint "sub_topics_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_topics_id"], name: "index_rel_topic_sub_topics_on_sub_topics_id"
    t.index ["topics_id"], name: "index_rel_topic_sub_topics_on_topics_id"
  end

  create_table "responses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "datetime", null: false
    t.bigint "comments_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comments_id"], name: "index_responses_on_comments_id"
    t.index ["users_id"], name: "index_responses_on_users_id"
  end

  create_table "sub_topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sub_topic_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "topic_name", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", null: false
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "user_token"
    t.bigint "city_id", null: false
    t.string "score"
    t.string "talk_to_us"
    t.bigint "photos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["photos_id"], name: "fk_rails_9fc6692384"
  end

  add_foreign_key "cities", "countries", column: "countries_id"
  add_foreign_key "comments", "fragments"
  add_foreign_key "comments", "users"
  add_foreign_key "fragments", "photos", column: "photos_id"
  add_foreign_key "fragments", "users", column: "users_id"
  add_foreign_key "friends", "users", column: "followed"
  add_foreign_key "friends", "users", column: "follower"
  add_foreign_key "preferences", "sub_topics"
  add_foreign_key "preferences", "users"
  add_foreign_key "reactions", "fragments", column: "fragments_id"
  add_foreign_key "reactions", "users", column: "users_id"
  add_foreign_key "rel_fragment_sub_topics", "fragments", column: "fragments_id"
  add_foreign_key "rel_fragment_sub_topics", "sub_topics", column: "sub_topics_id"
  add_foreign_key "rel_topic_sub_topics", "sub_topics", column: "sub_topics_id"
  add_foreign_key "rel_topic_sub_topics", "topics", column: "topics_id"
  add_foreign_key "responses", "comments", column: "comments_id"
  add_foreign_key "responses", "users", column: "users_id"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "photos", column: "photos_id"
end
