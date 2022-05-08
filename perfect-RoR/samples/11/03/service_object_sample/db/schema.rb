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

ActiveRecord::Schema.define(version: 2020_06_07_074859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_account_money_transfers", force: :cascade do |t|
    t.bigint "from_id", null: false
    t.bigint "to_id", null: false
    t.decimal "amount", precision: 19, scale: 4, null: false
    t.string "currency", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_bank_account_money_transfers_on_from_id"
    t.index ["to_id"], name: "index_bank_account_money_transfers_on_to_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.decimal "balance", precision: 19, scale: 4, null: false
    t.string "currency", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bank_account_money_transfers", "bank_accounts", column: "from_id"
  add_foreign_key "bank_account_money_transfers", "bank_accounts", column: "to_id"
end
