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

ActiveRecord::Schema.define(version: 0) do

  create_table "clients", force: :cascade do |t|
    t.text "client_contact"
    t.text "client_name"
    t.text "client_address"
    t.text "password_digest"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "amount"
    t.integer "provider_id"
    t.integer "client_id"
    t.integer "service_id"
    t.datetime "created_at"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["provider_id"], name: "index_orders_on_provider_id"
    t.index ["service_id"], name: "index_orders_on_service_id"
  end

  create_table "providers", force: :cascade do |t|
    t.text "provider_contact"
    t.text "provider_name"
    t.text "provider_address"
    t.integer "rate"
    t.text "description"
    t.text "password_digest"
  end

  create_table "services", force: :cascade do |t|
    t.text "service_desc"
  end

  create_table "sps", force: :cascade do |t|
    t.integer "provider_id"
    t.integer "service_id"
    t.index ["provider_id"], name: "index_sps_on_provider_id"
    t.index ["service_id"], name: "index_sps_on_service_id"
  end

end
