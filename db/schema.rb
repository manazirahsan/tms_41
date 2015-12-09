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

ActiveRecord::Schema.define(version: 20151209111926) do

  create_table "activities", force: :cascade do |t|
    t.string   "activity_type",  limit: 255
    t.integer  "user_id",        limit: 4
    t.integer  "target_id",      limit: 4
    t.integer  "course_id",      limit: 4
    t.integer  "subject_id",     limit: 4
    t.integer  "task_id",        limit: 4
    t.string   "action_message", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "activities", ["course_id"], name: "index_activities_on_course_id", using: :btree
  add_index "activities", ["subject_id"], name: "index_activities_on_subject_id", using: :btree
  add_index "activities", ["task_id"], name: "index_activities_on_task_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "course_subject_tasks", force: :cascade do |t|
    t.integer  "course_subject_id", limit: 4
    t.integer  "task_id",           limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "course_subject_tasks", ["course_subject_id"], name: "index_course_subject_tasks_on_course_subject_id", using: :btree
  add_index "course_subject_tasks", ["task_id"], name: "index_course_subject_tasks_on_task_id", using: :btree

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "subject_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id", using: :btree

  create_table "user_course_subjects", force: :cascade do |t|
    t.integer  "user_course_id",  limit: 4
    t.integer  "user_subject_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_course_subjects", ["user_course_id"], name: "index_user_course_subjects_on_user_course_id", using: :btree
  add_index "user_course_subjects", ["user_subject_id"], name: "index_user_course_subjects_on_user_subject_id", using: :btree

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "course_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id", using: :btree
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id", using: :btree

  create_table "user_subject_tasks", force: :cascade do |t|
    t.integer  "user_subject_id", limit: 4
    t.integer  "user_task_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_subject_tasks", ["user_subject_id"], name: "index_user_subject_tasks_on_user_subject_id", using: :btree
  add_index "user_subject_tasks", ["user_task_id"], name: "index_user_subject_tasks_on_user_task_id", using: :btree

  create_table "user_subjects", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "course_subject_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "user_subjects", ["course_subject_id"], name: "index_user_subjects_on_course_subject_id", using: :btree
  add_index "user_subjects", ["user_id"], name: "index_user_subjects_on_user_id", using: :btree

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_tasks", ["task_id"], name: "index_user_tasks_on_task_id", using: :btree
  add_index "user_tasks", ["user_id"], name: "index_user_tasks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "role",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "courses"
  add_foreign_key "activities", "subjects"
  add_foreign_key "activities", "tasks"
  add_foreign_key "activities", "users"
  add_foreign_key "course_subject_tasks", "course_subjects"
  add_foreign_key "course_subject_tasks", "tasks"
  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "tasks", "subjects"
  add_foreign_key "user_course_subjects", "user_courses"
  add_foreign_key "user_course_subjects", "user_subjects"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
  add_foreign_key "user_subject_tasks", "user_subjects"
  add_foreign_key "user_subject_tasks", "user_tasks"
  add_foreign_key "user_subjects", "course_subjects"
  add_foreign_key "user_subjects", "users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "users"
end
