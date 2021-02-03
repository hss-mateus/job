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

ActiveRecord::Schema.define(version: 2021_02_03_184640) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subdomain"], name: "index_companies_on_subdomain", unique: true
  end

  create_table "company_accesses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"user\", \"company\"", name: "index_company_accesses_on_user_and_company", unique: true
    t.index ["company_id"], name: "index_company_accesses_on_company_id"
    t.index ["user_id"], name: "index_company_accesses_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "job_posting_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_posting_id", "user_id"], name: "index_job_applications_on_job_posting_id_and_user_id", unique: true
    t.index ["job_posting_id"], name: "index_job_applications_on_job_posting_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "job_postings", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_job_postings_on_company_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "address"
    t.string "description"
    t.string "experience"
    t.string "education"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_resumes_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "company_accesses", "companies"
  add_foreign_key "company_accesses", "users"
  add_foreign_key "job_applications", "job_postings"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_postings", "companies"
end
