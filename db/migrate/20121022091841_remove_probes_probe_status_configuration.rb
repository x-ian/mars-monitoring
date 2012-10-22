class RemoveProbesProbeStatusConfiguration < ActiveRecord::Migration
  def up
    drop_table :probes_probe_status_configrations
  end

  def down
    create_table :probes_probe_status_configrations do |t|
      t.integer :probe_id
      t.integer :probe_status_configuration_id

      t.timestamps
    end
  end
end
