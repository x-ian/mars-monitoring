class AddProbeConfigurationIdToProbe < ActiveRecord::Migration
  def change
    add_column :probes, :probe_configuration_id, :integer
  end
end
