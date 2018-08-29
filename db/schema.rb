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

ActiveRecord::Schema.define(version: 2018_08_29_142832) do

  create_table "bodegas", force: :cascade do |t|
    t.string "nombre"
    t.string "ubicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bodegas_materials", force: :cascade do |t|
    t.integer "material_id"
    t.integer "bodega_id"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bodega_id"], name: "index_bodegas_materials_on_bodega_id"
    t.index ["material_id"], name: "index_bodegas_materials_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials_proveedors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "material_id"
    t.integer "proveedor_id"
    t.index ["material_id"], name: "index_materials_proveedors_on_material_id"
    t.index ["proveedor_id"], name: "index_materials_proveedors_on_proveedor_id"
  end

  create_table "materials_solicituds", force: :cascade do |t|
    t.integer "material_id"
    t.integer "solicitud_id"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_materials_solicituds_on_material_id"
    t.index ["solicitud_id"], name: "index_materials_solicituds_on_solicitud_id"
  end

  create_table "orden_de_compras", force: :cascade do |t|
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "material_id"
    t.integer "usuario_id"
    t.index ["material_id"], name: "index_orden_de_compras_on_material_id"
    t.index ["usuario_id"], name: "index_orden_de_compras_on_usuario_id"
  end

  create_table "proveedors", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicituds", force: :cascade do |t|
    t.integer "usuario_id"
    t.string "nombre"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bodega_id"
    t.index ["bodega_id"], name: "index_solicituds_on_bodega_id"
    t.index ["usuario_id"], name: "index_solicituds_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.integer "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
  end

end
