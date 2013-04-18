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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130418135659) do

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "developers", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "developers", ["country_id"], :name => "index_developers_on_country_id"

  create_table "editors", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_versions", :force => true do |t|
    t.integer  "year"
    t.integer  "game_id"
    t.integer  "system_id"
    t.integer  "media_id"
    t.integer  "developer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "game_versions", ["developer_id"], :name => "index_game_versions_on_developer_id"
  add_index "game_versions", ["game_id"], :name => "index_game_versions_on_game_id"
  add_index "game_versions", ["media_id"], :name => "index_game_versions_on_media_id"
  add_index "game_versions", ["system_id"], :name => "index_game_versions_on_system_id"

  create_table "games", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "publisher_id"
    t.integer  "setting_id"
    t.integer  "perspective_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "games", ["perspective_id"], :name => "index_games_on_perspective_id"
  add_index "games", ["publisher_id"], :name => "index_games_on_publisher_id"
  add_index "games", ["setting_id"], :name => "index_games_on_setting_id"

  create_table "games_genres", :id => false, :force => true do |t|
    t.integer  "game_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "games_genres", ["game_id"], :name => "index_games_genres_on_game_id"
  add_index "games_genres", ["genre_id"], :name => "index_games_genres_on_genre_id"

  create_table "genres", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "issues", :force => true do |t|
    t.integer  "magazine_id"
    t.integer  "editor_id"
    t.integer  "sequence"
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "issues", ["editor_id"], :name => "index_issues_on_editor_id"
  add_index "issues", ["magazine_id"], :name => "index_issues_on_magazine_id"

  create_table "magazines", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "manufacturers", ["country_id"], :name => "index_manufacturers_on_country_id"

  create_table "media", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.integer  "volume_id"
    t.string   "label"
    t.integer  "sequence"
    t.integer  "scan_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["volume_id"], :name => "index_pages_on_volume_id"

  create_table "perspectives", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publishers", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "publishers", ["country_id"], :name => "index_publishers_on_country_id"

  create_table "scan_authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scan_authors_volumes", :id => false, :force => true do |t|
    t.integer "scan_author_id"
    t.integer "volume_id"
  end

  add_index "scan_authors_volumes", ["scan_author_id", "volume_id"], :name => "index_scan_authors_volumes_on_scan_author_id_and_volume_id"

  create_table "scans", :force => true do |t|
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "systems", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "manufacturer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "systems", ["manufacturer_id"], :name => "index_systems_on_manufacturer_id"

  create_table "trick_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tricks", :force => true do |t|
    t.integer  "game_version_id"
    t.integer  "trick_type_id"
    t.integer  "volume_id"
    t.integer  "page"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "page_id"
  end

  add_index "tricks", ["game_version_id"], :name => "index_tricks_on_game_version_id"
  add_index "tricks", ["page_id"], :name => "index_tricks_on_page_id"
  add_index "tricks", ["trick_type_id"], :name => "index_tricks_on_trick_type_id"
  add_index "tricks", ["volume_id"], :name => "index_tricks_on_volume_id"

  create_table "volume_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "volumes", :force => true do |t|
    t.integer  "issue_id"
    t.integer  "volume_type_id"
    t.string   "label"
    t.integer  "pages_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "volumes", ["issue_id"], :name => "index_volumes_on_issue_id"

end
