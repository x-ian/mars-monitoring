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

ActiveRecord::Schema.define(:version => 20120916195642) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.integer  "parent_location_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "message_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "probe_id"
    t.integer  "message_type_id"
    t.integer  "outgoing_message_count"
    t.integer  "restart_count"
    t.datetime "device_time"
    t.datetime "server_time"
    t.integer  "device_uptime"
    t.integer  "value1"
    t.integer  "value2"
    t.integer  "value3"
    t.integer  "value4"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.boolean  "probe_enabled"
  end

  create_table "probe_status_configurations", :force => true do |t|
    t.string   "rule_ok"
    t.string   "rule_warning"
    t.string   "rule_error"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "rule_assumed"
  end

  create_table "probes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "customer_id"
    t.integer  "location_id"
    t.string   "location_coordinates"
    t.integer  "service_classification_id"
    t.boolean  "enabled"
  end

  create_table "probes_probe_status_configrations", :force => true do |t|
    t.integer  "probe_id"
    t.integer  "probe_status_configuration_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "service_classifications", :force => true do |t|
    t.string   "name"
    t.integer  "parent_service_classification_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "user_locations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_service_classifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "service_classification_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
