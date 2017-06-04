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

ActiveRecord::Schema.define(version: 20170604055954) do

  create_table "form_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "label", null: false
    t.boolean "required", default: false
    t.bigint "form_id", null: false
    t.bigint "question_type_id", null: false
    t.index ["form_id"], name: "index_form_questions_on_form_id"
    t.index ["question_type_id"], name: "index_form_questions_on_question_type_id"
  end

  create_table "forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", null: false
  end

  create_table "question_answer_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "label", null: false
    t.bigint "form_question_id", null: false
    t.index ["form_question_id"], name: "index_question_answer_options_on_form_question_id"
  end

  create_table "question_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "kind", null: false
    t.string "label", null: false
    t.boolean "has_multiple_answers", default: false
  end

  create_table "user_questions_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "answer", null: false
    t.bigint "form_question_id", null: false
    t.bigint "question_answer_option_id", null: false
    t.bigint "protected_id", null: false
    t.bigint "officer_id"
    t.index ["form_question_id"], name: "index_user_questions_answers_on_form_question_id"
    t.index ["officer_id"], name: "index_user_questions_answers_on_officer_id"
    t.index ["protected_id"], name: "index_user_questions_answers_on_protected_id"
    t.index ["question_answer_option_id"], name: "index_user_questions_answers_on_question_answer_option_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "email"
    t.integer "user_class", null: false
    t.string "rg"
    t.string "cpf", null: false
    t.string "address", null: false
    t.string "cep", null: false
    t.string "phone"
    t.date "birthday", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "form_questions", "forms", on_delete: :cascade
  add_foreign_key "form_questions", "question_types", on_delete: :cascade
  add_foreign_key "question_answer_options", "form_questions", on_delete: :cascade
  add_foreign_key "user_questions_answers", "form_questions", on_delete: :cascade
end
