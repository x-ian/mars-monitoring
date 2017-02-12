class AddValueTypesToProbeTypes < ActiveRecord::Migration
  def change
    add_column :probe_types, :value5_type_id, :integer
    add_column :probe_types, :value6_type_id, :integer
    add_column :probe_types, :value7_type_id, :integer
    add_column :probe_types, :value8_type_id, :integer
    add_column :probe_types, :value9_type_id, :integer
    add_column :probe_types, :value10_type_id, :integer
    add_column :probe_types, :value11_type_id, :integer
    add_column :probe_types, :value12_type_id, :integer
    add_column :probe_types, :value13_type_id, :integer
    add_column :probe_types, :value14_type_id, :integer
    add_column :probe_types, :value15_type_id, :integer
    add_column :probe_types, :value16_type_id, :integer
  end
end
