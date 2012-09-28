class CreateProbesProbeStatusConfigrations < ActiveRecord::Migration
  def change
    create_table :probes_probe_status_configrations do |t|
      t.integer :probe_id
      t.integer :probe_status_configuration_id

      t.timestamps
    end
  end
end
