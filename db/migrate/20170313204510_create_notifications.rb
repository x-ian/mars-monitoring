class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :reason_id
      t.integer :probe_id
      t.integer :message_id
      t.integer :invalid_message_id
      t.integer :event_id
      t.integer :notification_channel_id
      t.datetime :scheduled_at
      t.datetime :sent_at

      t.timestamps
    end
  end
end
