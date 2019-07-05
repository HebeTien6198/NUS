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

ActiveRecord::Schema.define(version: 2019_07_05_095624) do

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "des"
    t.string "numOfPhotos"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_albums_on_User_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "following_id"
    t.integer "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_follows_on_follower_id"
    t.index ["following_id"], name: "index_follows_on_following_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "User_id"
    t.integer "Photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Photo_id"], name: "index_likes_on_Photo_id"
    t.index ["User_id"], name: "index_likes_on_User_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "des"
    t.integer "User_id"
    t.integer "sharingMode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["User_id"], name: "index_photos_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstName"
    t.string "lastName"
    t.boolean "admin"
    t.datetime "lastLogin"
    t.string "avatar"
  end

end
