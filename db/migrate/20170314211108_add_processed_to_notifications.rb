class AddProcessedToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :processed, :boolean
  end
end
