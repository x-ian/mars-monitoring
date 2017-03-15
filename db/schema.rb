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

ActiveRecord::Schema.define(version: 20170315100738) do

  create_table "communication_channels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.float    "value"
    t.integer  "message_id"
    t.integer  "probe_status_id"
    t.integer  "value_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "invalid_messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "reason"
    t.boolean  "read"
    t.string   "source",     limit: 255
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "name",               limit: 255
    t.integer  "parent_location_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "message_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "probe_id"
    t.integer  "message_type_id"
    t.integer  "outgoing_message_count"
    t.integer  "restart_count"
    t.datetime "device_time"
    t.datetime "server_time"
    t.integer  "device_uptime"
    t.decimal  "value1",                 precision: 10, scale: 2
    t.decimal  "value2",                 precision: 10, scale: 2
    t.decimal  "value3",                 precision: 10, scale: 2
    t.decimal  "value4",                 precision: 10, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "probe_enabled"
    t.boolean  "archived"
    t.decimal  "value5",                 precision: 10, scale: 2
    t.decimal  "value6",                 precision: 10, scale: 2
    t.decimal  "value7",                 precision: 10, scale: 2
    t.decimal  "value8",                 precision: 10, scale: 2
    t.decimal  "value9",                 precision: 10, scale: 2
    t.decimal  "value10",                precision: 10, scale: 2
    t.decimal  "value11",                precision: 10, scale: 2
    t.decimal  "value12",                precision: 10, scale: 2
    t.decimal  "value13",                precision: 10, scale: 2
    t.decimal  "value14",                precision: 10, scale: 2
    t.decimal  "value15",                precision: 10, scale: 2
    t.decimal  "value16",                precision: 10, scale: 2
  end

  create_table "notification_channels", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_reasons", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "notification_reason_id"
    t.integer  "probe_id"
    t.integer  "message_id"
    t.integer  "invalid_message_id"
    t.integer  "event_id"
    t.integer  "notification_channel_id"
    t.datetime "scheduled_at"
    t.datetime "sent_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "processed"
    t.text     "error"
  end

  create_table "probe_configurations", force: :cascade do |t|
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
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name",               limit: 255
    t.float    "value5_threshold"
    t.float    "value6_threshold"
    t.float    "value7_threshold"
    t.float    "value8_threshold"
    t.float    "value9_threshold"
    t.float    "value10_threshold"
    t.float    "value11_threshold"
    t.float    "value12_threshold"
    t.float    "value13_threshold"
    t.float    "value14_threshold"
    t.float    "value15_threshold"
    t.float    "value16_threshold"
  end

  create_table "probe_statuses", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "status",         limit: 255
    t.boolean  "assumed"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "severity_order"
  end

  create_table "probe_types", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.text     "description"
    t.integer  "communication_channel_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "value1_type_id"
    t.integer  "value2_type_id"
    t.integer  "value3_type_id"
    t.integer  "value4_type_id"
    t.integer  "value5_type_id"
    t.integer  "value6_type_id"
    t.integer  "value7_type_id"
    t.integer  "value8_type_id"
    t.integer  "value9_type_id"
    t.integer  "value10_type_id"
    t.integer  "value11_type_id"
    t.integer  "value12_type_id"
    t.integer  "value13_type_id"
    t.integer  "value14_type_id"
    t.integer  "value15_type_id"
    t.integer  "value16_type_id"
  end

  create_table "probes", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "customer_id"
    t.integer  "location_id"
    t.string   "location_coordinates",    limit: 255
    t.boolean  "enabled"
    t.integer  "probe_configuration_id"
    t.integer  "probe_type_id"
    t.string   "cell_number",             limit: 255
    t.integer  "forward_subscription_id"
    t.integer  "responsible_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name",                            limit: 255
    t.integer  "subscriber1_id"
    t.integer  "subscriber2_id"
    t.integer  "subscriber3_id"
    t.integer  "subscriber4_id"
    t.integer  "subscriber5_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "include_heartbeat"
    t.boolean  "include_alarm"
    t.boolean  "include_restart"
    t.boolean  "generate_alarm_from_heartbeat"
    t.boolean  "generate_restart_from_heartbeat"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255
    t.string   "mobile_number",          limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "role",                   limit: 255
    t.string   "time_zone",              limit: 255
    t.text     "org_unit"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "value_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "cumulative"
  end

end
