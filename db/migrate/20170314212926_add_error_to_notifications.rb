class AddErrorToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :error, :text
  end
end
