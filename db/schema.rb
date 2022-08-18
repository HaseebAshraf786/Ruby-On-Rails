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

ActiveRecord::Schema[7.0].define(version: 2022_08_17_065000) do
  create_table "applicants", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "astatus"
    t.index ["post_id"], name: "index_applicants_on_post_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "requirement"
    t.integer "budget"
    t.string "description"
    t.integer "seller_id"
    t.integer "buyer_id"
    t.integer "profiles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profiles_id"], name: "index_gigs_on_profiles_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "requirement"
    t.integer "budget"
    t.string "description"
    t.integer "seller_id"
    t.integer "buyer_id"
    t.integer "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pstatus"
    t.integer "progress"
    t.integer "rate"
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "hired_freelacers"
    t.string "name"
    t.integer "phone"
    t.string "email"
    t.string "country"
    t.integer "pending_projects"
    t.integer "completed_projects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "password_digest"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "perhourrate"
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_skills_on_post_id"
  end

  add_foreign_key "applicants", "posts"
  add_foreign_key "gigs", "profiles", column: "profiles_id"
  add_foreign_key "posts", "profiles"
  add_foreign_key "skills", "posts"
end
