# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_09_173110) do

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

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.integer "cohort_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "instructor_id"
    t.string "password_digest"
  end

  create_table "oauth_states", force: :cascade do |t|
    t.string "state"
    t.text "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_oauth_states_on_state"
  end

  create_table "papers", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.integer "assignment_id"
    t.boolean "reviewed?", default: false
    t.integer "reviewer_id"
    t.integer "author_id"
    t.boolean "edited?", default: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "paper_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_cohorts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.integer "cohort_id"
    t.integer "student_cohort_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "google_token"
    t.string "google_refresh_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
