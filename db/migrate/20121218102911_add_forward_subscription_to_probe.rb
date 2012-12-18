class AddForwardSubscriptionToProbe < ActiveRecord::Migration
  def change
    add_column :probes, :forward_subscription_id, :integer
  end
end
