class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :reason_id
      t.integer :probe_id
      t.integer :notification_channel_id
      t.text :to
      t.text :subject
      t.text :body
      t.datetime :scheduled_at
      t.datetime :sent_at

      t.timestamps
    end
  end
end
