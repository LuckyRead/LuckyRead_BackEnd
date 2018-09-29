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

ActiveRecord::Schema.define(version: 2018_09_29_171528) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idcomment"
    t.text "message"
    t.integer "fragment_idfragment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fragments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idfragment"
    t.text "title"
    t.text "introduction"
    t.text "content"
    t.text "source"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idphoto"
    t.text "path"
    t.text "user_username"
    t.integer "fragment_idfragment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idresponse"
    t.datetime "date"
    t.text "message"
    t.integer "comment_idcoment"
    t.text "user_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_topics", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idsub_topic"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idtopic"
    t.text "name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_fragments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "iduserfragment"
    t.text "title"
    t.text "introduction"
    t.text "content"
    t.text "source"
    t.integer "score"
    t.text "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "username"
    t.string "name"
    t.string "lastname"
    t.text "email"
    t.text "password"
    t.integer "score"
    t.text "talk_to_us"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Id_rel_country_city"
  end

end
