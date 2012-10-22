class AddProbeTypeIdToProbe < ActiveRecord::Migration
  def change
    add_column :probes, :probe_type_id, :integer
  end
end
