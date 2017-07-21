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

ActiveRecord::Schema.define(version: 20170721072220) do

  create_table "operating_systems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "edition"
    t.string "package_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_dependencies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "package_a_id", null: false
    t.integer "package_b_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_system_dependencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "package_id"
    t.bigint "operating_system_id"
    t.bigint "system_dependency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operating_system_id"], name: "index_package_system_dependencies_on_operating_system_id"
    t.index ["package_id", "operating_system_id"], name: "index_package_id_and_os_id"
    t.index ["package_id"], name: "index_package_system_dependencies_on_package_id"
    t.index ["system_dependency_id"], name: "index_package_system_dependencies_on_system_dependency_id"
  end

  create_table "packages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "version"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_dependencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
