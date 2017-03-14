class CreateNotificationReasons < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_reasons do |t|
      t.text :name

      t.timestamps
    end
  end
end
