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

ActiveRecord::Schema[8.0].define(version: 2025_08_12_231044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "etiquetas", force: :cascade do |t|
    t.date "data_emissao"
    t.string "tipo"
    t.integer "quantidade"
    t.boolean "isento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.bigint "etiqueta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["etiqueta_id"], name: "index_partes_on_etiqueta_id"
  end

  add_foreign_key "partes", "etiquetas"
end
