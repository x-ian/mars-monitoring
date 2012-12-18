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

ActiveRecord::Schema.define(:version => 20121218102911) do

  create_table "communication_channels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.float    "value"
    t.integer  "message_id"
    t.integer  "probe_status_id"
    t.integer  "value_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "invalid_messages", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "reason"
    t.boolean  "read"
    t.string   "source"
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
    t.boolean  "archived"
  end

  create_table "probe_configurations", :force => true do |t|
    t.text     "rule_ok"
    t.text     "rule_warning"
    t.text     "rule_error"
    t.text     "rule_assumed"
    t.integer  "heartbeat_interval"
    t.integer  "alarm_interval"
    t.float    "value1_threshold"
    t.float    "value2_threshold"
    t.float    "value3_threshold"
    t.float    "value4_threshold"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "name"
  end

  create_table "probe_statuses", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.boolean  "assumed"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "severity_order"
  end

  create_table "probe_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "communication_channel_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "value1_type_id"
    t.integer  "value2_type_id"
    t.integer  "value3_type_id"
    t.integer  "value4_type_id"
  end

  create_table "probes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "customer_id"
    t.integer  "location_id"
    t.string   "location_coordinates"
    t.boolean  "enabled"
    t.integer  "probe_configuration_id"
    t.integer  "probe_type_id"
    t.string   "cell_number"
    t.integer  "forward_subscription_id"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "name"
    t.integer  "subscriber1_id"
    t.integer  "subscriber2_id"
    t.integer  "subscriber3_id"
    t.integer  "subscriber4_id"
    t.integer  "subscriber5_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "email"
    t.string   "mobile_number"
  end

  create_table "value_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "cumulative"
  end

end
