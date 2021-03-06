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

ActiveRecord::Schema.define(version: 2020_02_06_042332) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.text "describle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "privacy", default: "professed"
  end

  create_table "service_of_vendors", force: :cascade do |t|
    t.string "describle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.integer "service_id"
    t.index ["service_id"], name: "index_service_of_vendors_on_service_id"
    t.index ["vendor_id"], name: "index_service_of_vendors_on_vendor_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "describle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "describle"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
    t.integer "service_id"
    t.integer "service_of_vendor_id"
    t.index ["schedule_id"], name: "index_tasks_on_schedule_id"
    t.index ["service_id"], name: "index_tasks_on_service_id"
    t.index ["service_of_vendor_id"], name: "index_tasks_on_service_of_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "address"
    t.integer "sex"
    t.datetime "birthday"
    t.string "role", default: "member"
    t.string "provider"
    t.string "uid"
    t.integer "schedule_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["schedule_id"], name: "index_users_on_schedule_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "place"
    t.string "phone"
    t.string "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

end
