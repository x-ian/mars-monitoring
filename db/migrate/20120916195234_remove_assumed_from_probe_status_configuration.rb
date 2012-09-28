class RemoveAssumedFromProbeStatusConfiguration < ActiveRecord::Migration
  def up
    remove_column :probe_status_configurations, :assumed
  end

  def down
    add_column :probe_status_configurations, :assumed, :string
  end
end
