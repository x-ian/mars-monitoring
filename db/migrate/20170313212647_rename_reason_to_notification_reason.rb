class RenameReasonToNotificationReason < ActiveRecord::Migration[5.0]
  def change
    rename_column :notifications, :reason_id, :notification_reason_id
  end
end
