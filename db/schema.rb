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

ActiveRecord::Schema.define(version: 20180131222321) do

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "cover_image"
    t.integer  "order_listed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "information", force: :cascade do |t|
    t.string   "title"
    t.string   "headline"
    t.string   "name"
    t.text     "about_me"
    t.string   "instagram"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "banner_image"
    t.string   "about_image"
    t.string   "contact_image"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
