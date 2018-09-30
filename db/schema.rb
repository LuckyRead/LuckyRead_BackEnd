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

ActiveRecord::Schema.define(version: 2018_09_30_082530) do

  create_table "cities", primary_key: "id_city", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "city_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_has_country", primary_key: "id_city_has_country", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "country_id", null: false
    t.index ["city_id"], name: "city_id"
    t.index ["country_id"], name: "country_id"
  end

  create_table "comments", primary_key: "idcomment", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "message", null: false
    t.bigint "fragment_idfragment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date", null: false
    t.string "user_iduser", null: false
    t.index ["user_iduser"], name: "user_iduser"
  end

  create_table "countries", primary_key: "id_country", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "country_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fragments", primary_key: "idfragment", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "introduction"
    t.string "content", null: false
    t.string "source"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "followed", null: false
    t.string "follower", null: false
    t.index ["followed"], name: "followed"
    t.index ["follower"], name: "follower"
  end

  create_table "photos", primary_key: "idphoto", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "path", null: false
    t.string "user_username"
    t.integer "fragment_idfragment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_username"], name: "user_username"
  end

  create_table "preference", primary_key: "id_preference", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "subtopic_id", null: false
    t.string "user_id", null: false
    t.integer "score", default: 0
    t.index ["subtopic_id"], name: "subtopic_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "reaction_user_fragment", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fragment_id", null: false
    t.string "reaction", null: false
    t.index ["fragment_id"], name: "fragment_id"
  end

  create_table "rel_topic_subtopic", primary_key: "id_rel_topic_subtopic", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "subtopic_id", null: false
  end

  create_table "responses", primary_key: "idresponse", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false
    t.text "message", null: false
    t.integer "comment_idcomment", null: false
    t.text "user_username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_idcomment"], name: "comment_idcomment"
  end

  create_table "subtopics", primary_key: "id_subtopic", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", primary_key: "idtopic", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name", null: false
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "username", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname", null: false
    t.text "email", null: false
    t.text "password", null: false
    t.integer "score", default: 0
    t.text "talk_to_us"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Id_rel_country_city", null: false
    t.index ["Id_rel_country_city"], name: "Id_rel_country_city"
  end

  add_foreign_key "city_has_country", "cities", primary_key: "id_city", name: "city_has_country_ibfk_1"
  add_foreign_key "city_has_country", "cities", primary_key: "id_city", name: "city_has_country_ibfk_3"
  add_foreign_key "city_has_country", "countries", primary_key: "id_country", name: "city_has_country_ibfk_2"
  add_foreign_key "city_has_country", "countries", primary_key: "id_country", name: "city_has_country_ibfk_4"
  add_foreign_key "comments", "users", column: "user_iduser", primary_key: "username", name: "comments_ibfk_1"
  add_foreign_key "comments", "users", column: "user_iduser", primary_key: "username", name: "comments_ibfk_2"
  add_foreign_key "friend", "users", column: "followed", primary_key: "username", name: "friend_ibfk_2"
  add_foreign_key "friend", "users", column: "followed", primary_key: "username", name: "friend_ibfk_4"
  add_foreign_key "friend", "users", column: "follower", primary_key: "username", name: "friend_ibfk_1"
  add_foreign_key "friend", "users", column: "follower", primary_key: "username", name: "friend_ibfk_3"
  add_foreign_key "photos", "users", column: "user_username", primary_key: "username", name: "photos_ibfk_1"
  add_foreign_key "photos", "users", column: "user_username", primary_key: "username", name: "photos_ibfk_2"
  add_foreign_key "preference", "subtopics", primary_key: "id_subtopic", name: "preference_ibfk_2"
  add_foreign_key "preference", "subtopics", primary_key: "id_subtopic", name: "preference_ibfk_4"
  add_foreign_key "preference", "users", primary_key: "username", name: "preference_ibfk_1"
  add_foreign_key "preference", "users", primary_key: "username", name: "preference_ibfk_3"
  add_foreign_key "reaction_user_fragment", "fragments", primary_key: "idfragment", name: "reaction_user_fragment_ibfk_1"
  add_foreign_key "reaction_user_fragment", "fragments", primary_key: "idfragment", name: "reaction_user_fragment_ibfk_2"
  add_foreign_key "responses", "comments", column: "comment_idcomment", primary_key: "idcomment", name: "responses_ibfk_1"
  add_foreign_key "responses", "comments", column: "comment_idcomment", primary_key: "idcomment", name: "responses_ibfk_2"
  add_foreign_key "users", "city_has_country", column: "Id_rel_country_city", primary_key: "id_city_has_country", name: "users_ibfk_1"
  add_foreign_key "users", "city_has_country", column: "Id_rel_country_city", primary_key: "id_city_has_country", name: "users_ibfk_2"
end
