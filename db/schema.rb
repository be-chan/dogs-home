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

ActiveRecord::Schema.define(version: 2021_01_27_140026) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.integer "dog_gender", null: false
    t.integer "dog_age_id", null: false
    t.integer "vaccine", null: false
    t.integer "surgery", null: false
    t.integer "prefecture_id", null: false
    t.string "feature", null: false
    t.string "reason", null: false
    t.string "remarks"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "inquiry_forms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "experience", null: false
    t.string "care_take", null: false
    t.string "hope", null: false
    t.bigint "inquiry_record_id"
    t.bigint "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_inquiry_forms_on_dog_id"
    t.index ["inquiry_record_id"], name: "index_inquiry_forms_on_inquiry_record_id"
  end

  create_table "inquiry_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dog_id"
    t.bigint "inquiry_form_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_inquiry_lists_on_dog_id"
    t.index ["inquiry_form_id"], name: "index_inquiry_lists_on_inquiry_form_id"
    t.index ["user_id"], name: "index_inquiry_lists_on_user_id"
  end

  create_table "inquiry_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_inquiry_records_on_dog_id"
    t.index ["user_id"], name: "index_inquiry_records_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", null: false
    t.string "full_name_kana", null: false
    t.string "postal_code", null: false
    t.integer "prefecture_id", null: false
    t.string "address", null: false
    t.string "building_name"
    t.string "phone_number", null: false
    t.integer "job_id", null: false
    t.integer "age_id", null: false
    t.integer "gender_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dogs", "users"
  add_foreign_key "inquiry_forms", "dogs"
  add_foreign_key "inquiry_forms", "inquiry_records"
  add_foreign_key "inquiry_lists", "dogs"
  add_foreign_key "inquiry_lists", "inquiry_forms"
  add_foreign_key "inquiry_lists", "users"
  add_foreign_key "inquiry_records", "dogs"
  add_foreign_key "inquiry_records", "users"
end