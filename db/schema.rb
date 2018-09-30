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

ActiveRecord::Schema.define(version: 2018_09_30_030401) do

<<<<<<< HEAD
  create_table "cities", primary_key: "id_city", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "city_name", null: false
=======
  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "idcomment"
    t.text "message"
    t.integer "fragment_idfragment"
>>>>>>> feature/8-poblar-la-bd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "city_has_country", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "country_id", null: false
  end

  create_table "comments", primary_key: "idcomment", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "message", null: false
    t.integer "fragment_idfragment", null: false
=======
  create_table "fragments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "idfragment"
    t.text "title"
    t.text "introduction"
    t.text "content"
    t.text "source"
    t.integer "score"
>>>>>>> feature/8-poblar-la-bd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date", null: false
    t.string "user_iduser", null: false
  end

<<<<<<< HEAD
  create_table "countries", primary_key: "id_country", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "country_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fragments", primary_key: "idfragment", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title", null: false
    t.string "introduction"
    t.string "content", null: false
    t.string "source"
    t.integer "score", default: 0
=======
  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "idphoto"
    t.text "path"
    t.text "user_username"
    t.integer "fragment_idfragment"
>>>>>>> feature/8-poblar-la-bd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "friend", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "followed", null: false
    t.string "follower", null: false
  end

  create_table "photos", primary_key: "idphoto", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "path", null: false
=======
  create_table "responses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "idresponse"
    t.datetime "date"
    t.text "message"
    t.integer "comment_idcoment"
>>>>>>> feature/8-poblar-la-bd
    t.text "user_username"
    t.integer "fragment_idfragment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "preference", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "subtopic_id", null: false
    t.bigint "user_id", null: false
    t.integer "score", default: 0
  end

  create_table "reaction_user_fragment", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fragment_id", null: false
    t.string "reaction", null: false
  end

  create_table "rel_subtopic_userfragment", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "subtopic_id", null: false
    t.bigint "userfragment_id", null: false
  end

  create_table "rel_topic_subtopic", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "subtopic_id", null: false
  end

  create_table "rel_userfragment_user", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "userfragment_id", null: false
  end

  create_table "responses", primary_key: "idresponse", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "date", null: false
    t.text "message", null: false
    t.integer "comment_idcoment", null: false
    t.text "user_username", null: false
=======
  create_table "sub_topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "idsub_topic"
    t.text "name"
>>>>>>> feature/8-poblar-la-bd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "subtopics", primary_key: "id_subtopic", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
=======
  create_table "topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "idtopic"
    t.text "name"
    t.integer "score"
>>>>>>> feature/8-poblar-la-bd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "topics", primary_key: "idtopic", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "name", null: false
    t.integer "score", default: 0
=======
  create_table "user_fragments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "iduserfragment"
    t.text "title"
    t.text "introduction"
    t.text "content"
    t.text "source"
    t.integer "score"
    t.text "state"
>>>>>>> feature/8-poblar-la-bd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "users", primary_key: "username", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname", null: false
    t.text "email", null: false
    t.text "password", null: false
    t.integer "score", default: 0
=======
  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "username"
    t.string "name"
    t.string "lastname"
    t.text "email"
    t.text "password"
    t.integer "score"
>>>>>>> feature/8-poblar-la-bd
    t.text "talk_to_us"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Id_rel_country_city", null: false
  end

end
