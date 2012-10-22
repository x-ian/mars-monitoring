class AddColumnsValueTypeToProbeType < ActiveRecord::Migration
  def change
    add_column :probe_types, :value1_type_id, :integer
    add_column :probe_types, :value2_type_id, :integer
    add_column :probe_types, :value3_type_id, :integer
    add_column :probe_types, :value4_type_id, :integer
  end
end
