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

ActiveRecord::Schema.define(version: 2019_12_13_112005) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "blogcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogcomments", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blogcategory_id"
    t.boolean "youtube"
    t.index ["blogcategory_id"], name: "index_blogs_on_blogcategory_id"
  end

  create_table "caves", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "url"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kana"
    t.string "double"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "title"
    t.text "message"
    t.boolean "checked", default: false
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_contacts_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "city_id"
    t.date "date"
    t.time "start"
    t.time "end"
    t.integer "peopleNum"
    t.integer "teacher_id"
    t.integer "cafe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "fee"
    t.boolean "finished", default: false
    t.boolean "realtime", default: false
    t.integer "place_id"
    t.index ["place_id"], name: "index_events_on_place_id"
  end

  create_table "line_stations", force: :cascade do |t|
    t.integer "line_id"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_line_stations_on_line_id"
    t.index ["station_id"], name: "index_line_stations_on_station_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.string "kana"
    t.integer "cd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "en_name"
    t.string "ja_name"
    t.string "placeId"
    t.string "website"
    t.decimal "latitude", precision: 15, scale: 12
    t.decimal "longitude", precision: 15, scale: 12
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_places_on_city_id"
  end

  create_table "prefecture_lines", force: :cascade do |t|
    t.integer "prefecture_id"
    t.integer "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_prefecture_lines_on_line_id"
    t.index ["prefecture_id"], name: "index_prefecture_lines_on_prefecture_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kana"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_id"
    t.integer "index"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude", precision: 15, scale: 12
    t.decimal "longitude", precision: 15, scale: 12
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_places", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_teacher_places_on_place_id"
    t.index ["teacher_id"], name: "index_teacher_places_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.boolean "gender"
    t.text "selfIntroduction"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.boolean "admin", default: false
    t.integer "city_id_id"
    t.index ["city_id_id"], name: "index_teachers_on_city_id_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.time "start"
    t.time "end"
    t.integer "sheet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.boolean "admin", default: false
    t.boolean "gender"
    t.text "selfIntroduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
