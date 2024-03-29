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

ActiveRecord::Schema.define(:version => 20121202052414) do

  create_table "analyses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data_points", :force => true do |t|
    t.float   "value"
    t.integer "field_id"
    t.integer "metric_id"
    t.integer "profile_id"
    t.integer "field_metric_id"
  end

  create_table "deploy_histories", :force => true do |t|
    t.datetime "at"
    t.string   "rev"
    t.string   "user"
    t.string   "url"
    t.string   "repo"
    t.integer  "newrelic_id"
  end

  create_table "field_metrics", :force => true do |t|
    t.integer "field_id"
    t.integer "metric_id"
  end

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "newrelic_id"
  end

  create_table "metrics", :force => true do |t|
    t.string   "name"
    t.integer  "newrelic_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "newrelics", :force => true do |t|
    t.string   "api_key"
    t.string   "account_id"
    t.string   "app_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string  "name"
    t.string  "type"
    t.integer "field_metric_id"
    t.integer "analysis_id"
  end

  create_table "time_ranges", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "timed_id"
    t.string   "timed_type"
  end

end
