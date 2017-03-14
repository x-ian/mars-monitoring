class AddGenerateAlarmFromHeartbeatToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :generate_alarm_from_heartbeat, :boolean
  end
end
