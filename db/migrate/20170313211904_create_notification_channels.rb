class CreateNotificationChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_channels do |t|
      t.text :name

      t.timestamps
    end
  end
end
