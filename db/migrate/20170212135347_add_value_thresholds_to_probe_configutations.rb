class AddValueThresholdsToProbeConfigutations < ActiveRecord::Migration
  def change
    add_column :probe_configurations, :value5_threshold, :float
    add_column :probe_configurations, :value6_threshold, :float
    add_column :probe_configurations, :value7_threshold, :float
    add_column :probe_configurations, :value8_threshold, :float
    add_column :probe_configurations, :value9_threshold, :float
    add_column :probe_configurations, :value10_threshold, :float
    add_column :probe_configurations, :value11_threshold, :float
    add_column :probe_configurations, :value12_threshold, :float
    add_column :probe_configurations, :value13_threshold, :float
    add_column :probe_configurations, :value14_threshold, :float
    add_column :probe_configurations, :value15_threshold, :float
    add_column :probe_configurations, :value16_threshold, :float
  end
end
