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

ActiveRecord::Schema[8.1].define(version: 2026_01_08_150836) do
  create_table "privileges", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.string "description"
    t.datetime "updated_at", null: false
  end

  create_table "user_privileges", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "privilege_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["privilege_id"], name: "index_user_privileges_on_privilege_id"
    t.index ["user_id"], name: "index_user_privileges_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "nome", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nome"], name: "index_users_on_nome", unique: true
  end

  add_foreign_key "user_privileges", "privileges"
  add_foreign_key "user_privileges", "users"
end
