class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :probe_id
      t.integer :message_type_id
      t.integer :outgoing_message_count
      t.integer :restart_count
      t.datetime :device_time
      t.datetime :server_time
      t.integer :device_uptime
      t.integer :value1
      t.integer :value2
      t.integer :value3
      t.integer :value4

      t.timestamps
    end
  end
end
