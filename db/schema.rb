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

ActiveRecord::Schema.define(version: 2022_01_27_013443) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "title"
    t.boolean "corrected"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "mark"
    t.integer "exam_id"
    t.string "last_name"
  end

  create_table "candidates_exams", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "exam_id"
    t.index ["candidate_id"], name: "index_candidates_exams_on_candidate_id"
    t.index ["exam_id"], name: "index_candidates_exams_on_exam_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exams", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "started_at"
    t.string "token"
    t.datetime "ended_at"
    t.integer "status", default: 0
    t.index ["token"], name: "index_exams_on_token"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.string "kind"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id", "created_at"], name: "index_questions_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "question_id"
    t.integer "answer_id"
    t.integer "exam_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "text_answer"
    t.index ["answer_id", "created_at"], name: "index_results_on_answer_id_and_created_at"
    t.index ["exam_id"], name: "index_results_on_exam_id"
    t.index ["question_id", "created_at"], name: "index_results_on_question_id_and_created_at"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "results", "exams"
end
