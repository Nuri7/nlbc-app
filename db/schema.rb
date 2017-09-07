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

ActiveRecord::Schema.define(version: 20170907154303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "bootcamp_challenges", force: :cascade do |t|
    t.integer  "bootcamp_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bootcamp_id"], name: "index_bootcamp_challenges_on_bootcamp_id", using: :btree
    t.index ["challenge_id"], name: "index_bootcamp_challenges_on_challenge_id", using: :btree
  end

  create_table "bootcamps", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "passion_id"
    t.text     "description"
    t.date     "date"
    t.time     "time"
    t.string   "location"
    t.index ["passion_id"], name: "index_bootcamps_on_passion_id", using: :btree
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "plans"
    t.integer  "bootcamp_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.string   "company_and_position"
    t.integer  "rate_bootcamp"
    t.string   "most_value"
    t.string   "least"
    t.text     "describe_bootcamp"
    t.integer  "rate_trainer"
    t.text     "tips_to_trainer"
    t.text     "suggestion"
    t.string   "other_bootcamps"
    t.string   "contact"
    t.index ["bootcamp_id"], name: "index_feedbacks_on_bootcamp_id", using: :btree
  end

  create_table "passions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_teachers_on_challenge_id", using: :btree
    t.index ["user_id"], name: "index_teachers_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "per_team"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "mix_genders"
  end

  create_table "user_passions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "passion_id"
    t.index ["passion_id"], name: "index_user_passions_on_passion_id", using: :btree
    t.index ["user_id"], name: "index_user_passions_on_user_id", using: :btree
  end

  create_table "user_teams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "male"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role",                   default: "student"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bootcamp_challenges", "bootcamps"
  add_foreign_key "bootcamp_challenges", "challenges"
  add_foreign_key "bootcamps", "passions"
  add_foreign_key "feedbacks", "bootcamps"
  add_foreign_key "teachers", "challenges"
  add_foreign_key "teachers", "users"
  add_foreign_key "user_passions", "passions"
  add_foreign_key "user_passions", "users"
end
