class AddIncludeAlarmToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :include_alarm, :boolean
  end
end
