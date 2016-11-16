class AddIncludeRestartToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :include_restart, :boolean
  end
end
