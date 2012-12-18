class RenameSubscribersToSubscriptions < ActiveRecord::Migration
  def up
    rename_table :subscribers, :subscriptions
  end

  def down
    rename_table :subscriptions, :subscribers
  end
end
