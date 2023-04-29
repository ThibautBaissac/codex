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

ActiveRecord::Schema[7.0].define(version: 2023_04_29_122704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "elements", force: :cascade do |t|
    t.string "title"
    t.string "category", default: [], null: false, array: true
    t.text "description"
    t.string "instrumentation", default: [], array: true
    t.boolean "popular", default: false
    t.boolean "with_influence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mouvement_elements", force: :cascade do |t|
    t.string "location"
    t.bigint "mouvement_id", null: false
    t.bigint "element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_mouvement_elements_on_element_id"
    t.index ["mouvement_id"], name: "index_mouvement_elements_on_mouvement_id"
  end

  create_table "mouvements", force: :cascade do |t|
    t.integer "number"
    t.string "title"
    t.string "dedication"
    t.date "start_date"
    t.date "end_date"
    t.bigint "work_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_mouvements_on_work_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "password_digest"
    t.string "token", null: false
    t.string "refresh_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["refresh_token"], name: "index_users_on_refresh_token", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "work_elements", force: :cascade do |t|
    t.bigint "work_id", null: false
    t.bigint "element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_work_elements_on_element_id"
    t.index ["work_id"], name: "index_work_elements_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.integer "opus"
    t.text "description"
    t.string "instrumentation", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "mouvement_elements", "elements"
  add_foreign_key "mouvement_elements", "mouvements"
  add_foreign_key "mouvements", "works"
  add_foreign_key "work_elements", "elements"
  add_foreign_key "work_elements", "works"
end
