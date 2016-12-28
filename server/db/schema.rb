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

ActiveRecord::Schema.define(version: 20161228043824) do

  create_table "cards", force: :cascade do |t|
    t.string   "suit"
    t.integer  "face_value"
    t.boolean  "is_flipped_up"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "parent_card_id"
    t.integer  "child_card_id"
    t.index ["child_card_id"], name: "index_cards_on_child_card_id"
    t.index ["parent_card_id"], name: "index_cards_on_parent_card_id"
  end

end
