# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150327014200) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "addresses", force: true do |t|
    t.string   "rue"
    t.integer  "no_civic"
    t.string   "ville"
    t.string   "pays"
    t.string   "code_postal"
    t.string   "province"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.date     "date_naissance"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commandes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.date     "date"
    t.time     "heure"
    t.string   "status"
    t.integer  "numero_confirmation"
    t.integer  "total"
    t.integer  "livreur_id"
  end

  add_index "commandes", ["restaurant_id"], name: "index_commandes_on_restaurant_id"

  create_table "comptes", force: true do |t|
    t.text    "courriel"
    t.text    "mot_de_passe"
    t.integer "client_id"
    t.text    "created_at"
    t.text    "updated_at"
    t.integer "restaurateur_id"
    t.text    "livreur_id"
  end

  create_table "description_plats", force: true do |t|
    t.string   "nom"
    t.string   "description"
    t.float    "prix"
    t.integer  "plat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "description_plats", ["plat_id"], name: "index_description_plats_on_plat_id"

  create_table "entrepreneurs", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entrepreneurs", ["email"], name: "index_entrepreneurs_on_email", unique: true
  add_index "entrepreneurs", ["reset_password_token"], name: "index_entrepreneurs_on_reset_password_token", unique: true

  create_table "ligne_commandes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plat_id"
    t.integer  "commande_id"
    t.integer  "quantite"
  end

  add_index "ligne_commandes", ["commande_id"], name: "index_ligne_commandes_on_commande_id"
  add_index "ligne_commandes", ["plat_id"], name: "index_ligne_commandes_on_plat_id"

  create_table "livreurs", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "nom"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "only_entrepreneurs_authorizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plats", force: true do |t|
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "nom"
    t.integer  "restaurateur_id"
    t.integer  "coords_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurateurs", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
