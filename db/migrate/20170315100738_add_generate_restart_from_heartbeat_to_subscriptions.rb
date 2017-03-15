class AddGenerateRestartFromHeartbeatToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :generate_restart_from_heartbeat, :boolean
  end
end
