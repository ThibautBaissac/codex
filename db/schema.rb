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

ActiveRecord::Schema[7.1].define(version: 2024_02_02_134033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "user_roles", ["user", "admin", "super_admin"]

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

  create_table "annotations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "annotatable_type", null: false
    t.bigint "annotatable_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotatable_type", "annotatable_id"], name: "index_annotations_on_annotatable"
    t.index ["user_id"], name: "index_annotations_on_user_id"
  end

  create_table "artist_editors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "user_id"], name: "index_artist_editors_on_artist_id_and_user_id", unique: true
    t.index ["artist_id"], name: "index_artist_editors_on_artist_id"
    t.index ["user_id"], name: "index_artist_editors_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "birthdate"
    t.date "deathdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["firstname", "lastname"], name: "index_artists_on_firstname_and_lastname", unique: true
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "source_images", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.boolean "is_cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_source_images_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_sources_on_artist_id"
    t.index ["name", "artist_id"], name: "index_sources_on_name_and_artist_id", unique: true
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.string "taggable_type", null: false
    t.bigint "taggable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.enum "role", default: "user", null: false, enum_type: "user_roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writing_sources", force: :cascade do |t|
    t.bigint "writing_id", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_writing_sources_on_source_id"
    t.index ["writing_id", "source_id"], name: "index_writing_sources_on_writing_id_and_source_id", unique: true
    t.index ["writing_id"], name: "index_writing_sources_on_writing_id"
  end

  create_table "writings", force: :cascade do |t|
    t.date "date"
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "searchable_content"
    t.index ["artist_id"], name: "index_writings_on_artist_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "annotations", "users"
  add_foreign_key "artist_editors", "artists"
  add_foreign_key "artist_editors", "users"
  add_foreign_key "source_images", "sources"
  add_foreign_key "sources", "artists"
  add_foreign_key "taggings", "tags"
  add_foreign_key "writing_sources", "sources"
  add_foreign_key "writing_sources", "writings"
  add_foreign_key "writings", "artists"
end
