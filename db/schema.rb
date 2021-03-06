# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090531051117) do

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions_events", :id => false, :force => true do |t|
    t.integer "competition_id"
    t.integer "event_id"
  end

  add_index "competitions_events", ["competition_id"], :name => "index_competitions_events_on_competition_id"
  add_index "competitions_events", ["event_id"], :name => "index_competitions_events_on_event_id"

  create_table "competitions_users", :id => false, :force => true do |t|
    t.integer "competition_id"
    t.integer "user_id"
  end

  add_index "competitions_users", ["competition_id"], :name => "index_competitions_users_on_competition_id"
  add_index "competitions_users", ["user_id"], :name => "index_competitions_users_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "rules", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.decimal "deduction",   :precision => 3, :scale => 2
  end

  create_table "rules_rulesets", :id => false, :force => true do |t|
    t.integer "rule_id"
    t.integer "ruleset_id"
  end

  add_index "rules_rulesets", ["rule_id"], :name => "index_rules_rulesets_on_rule_id"
  add_index "rules_rulesets", ["ruleset_id"], :name => "index_rules_rulesets_on_ruleset_id"

  create_table "rulesets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
