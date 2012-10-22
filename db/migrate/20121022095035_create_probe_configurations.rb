class CreateProbeConfigurations < ActiveRecord::Migration
  def change
    create_table :probe_configurations do |t|
      t.string :ane
      t.text :rule_ok
      t.text :rule_warning
      t.text :rule_error
      t.text :rule_assumed
      t.integer :heartbeat_interval
      t.integer :alarm_interval
      t.integer :value1_type_id
      t.integer :value2_type_id
      t.integer :value3_type_id
      t.integer :value4_type_id
      t.float :value1_threshold
      t.float :value2_threshold
      t.float :value3_threshold
      t.float :value4_threshold

      t.timestamps
    end
  end
end
