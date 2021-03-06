# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150322175639) do

  create_table "answers", force: true do |t|
    t.string   "title",       limit: 200
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.string   "table_name"
    t.string   "action"
    t.integer  "deleted_id"
    t.text     "content"
    t.datetime "deleted_at"
    t.integer  "deleted_by"
  end

  create_table "questions", force: true do |t|
    t.string   "title",       limit: 200
    t.integer  "quizz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree
  add_index "questions", ["quizz_id"], name: "index_questions_on_quizz_id", using: :btree

  create_table "quizzs", force: true do |t|
    t.string   "category",    limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",       limit: 50
    t.string   "state",       limit: 11
    t.integer  "category_id"
    t.text     "options"
  end

  add_index "quizzs", ["category_id"], name: "index_quizzs_on_category_id", using: :btree

  create_table "user_assessments", force: true do |t|
    t.integer  "user_id"
    t.integer  "quizz_id"
    t.integer  "grade"
    t.integer  "current_question_id"
    t.integer  "state",               default: 0
    t.text     "user_answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_assessments", ["quizz_id"], name: "index_user_assessments_on_quizz_id", using: :btree
  add_index "user_assessments", ["user_id"], name: "index_user_assessments_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
    t.string   "ip"
    t.text     "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
