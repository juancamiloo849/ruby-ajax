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

ActiveRecord::Schema.define(version: 20170711221450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "latin_name"
    t.string "kingdom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region1s", force: :cascade do |t|
    t.string "name"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_region1s_on_animal_id"
  end

  create_table "region2s", force: :cascade do |t|
    t.string "name"
    t.bigint "sighting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sighting_id"], name: "index_region2s_on_sighting_id"
  end

  create_table "region4s", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sighting_id"
    t.index ["sighting_id"], name: "index_region4s_on_sighting_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "sighting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sighting_id"], name: "index_regions_on_sighting_id"
  end

  create_table "sightings", force: :cascade do |t|
    t.string "date"
    t.string "time"
    t.integer "latitude"
    t.integer "longitude"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region4_id"
    t.index ["animal_id"], name: "index_sightings_on_animal_id"
    t.index ["region4_id"], name: "index_sightings_on_region4_id"
  end

  add_foreign_key "region1s", "animals"
  add_foreign_key "region2s", "sightings"
  add_foreign_key "region4s", "sightings"
  add_foreign_key "regions", "sightings"
  add_foreign_key "sightings", "animals"
  add_foreign_key "sightings", "region4s"
end
