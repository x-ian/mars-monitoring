class DropAneFromProbeConfigurations < ActiveRecord::Migration
  def change
    remove_column :probe_configurations, :ane, :string
  end
end
