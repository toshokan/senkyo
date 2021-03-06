# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_24_021442) do

  create_table "answers", force: :cascade do |t|
    t.string "entry"
    t.string "ticket"
    t.integer "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "question_id"
    t.string "user"
    t.index ["question_id"], name: "index_people_on_question_id"
  end

  create_table "person_answers", force: :cascade do |t|
    t.string "qid"
    t.string "user"
  end

  create_table "questions", force: :cascade do |t|
    t.string "description"
    t.string "qid"
  end

  create_table "tellers", force: :cascade do |t|
    t.integer "question_id"
    t.string "user"
    t.index ["question_id"], name: "index_tellers_on_question_id"
  end

end
