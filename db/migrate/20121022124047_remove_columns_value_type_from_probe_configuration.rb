class RemoveColumnsValueTypeFromProbeConfiguration < ActiveRecord::Migration
  def change
    remove_column :probe_configurations, :value1_type_id
    remove_column :probe_configurations, :value2_type_id
    remove_column :probe_configurations, :value3_type_id
    remove_column :probe_configurations, :value4_type_id
  end
end
