class AddValueTypesToProbeConfigurations < ActiveRecord::Migration
  def change
    add_column :probe_configurations, :value5_type_id, :integer
    add_column :probe_configurations, :value6_type_id, :integer
    add_column :probe_configurations, :value7_type_id, :integer
    add_column :probe_configurations, :value8_type_id, :integer
    add_column :probe_configurations, :value9_type_id, :integer
    add_column :probe_configurations, :value10_type_id, :integer
    add_column :probe_configurations, :value11_type_id, :integer
    add_column :probe_configurations, :value12_type_id, :integer
    add_column :probe_configurations, :value13_type_id, :integer
    add_column :probe_configurations, :value14_type_id, :integer
    add_column :probe_configurations, :value15_type_id, :integer
    add_column :probe_configurations, :value16_type_id, :integer
  end
end
