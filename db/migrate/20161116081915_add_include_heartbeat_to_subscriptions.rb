class AddIncludeHeartbeatToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :include_heartbeat, :boolean
  end
end
