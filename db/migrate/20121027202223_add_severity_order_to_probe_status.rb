class AddSeverityOrderToProbeStatus < ActiveRecord::Migration
  def change
    add_column :probe_statuses, :severity_order, :integer
  end
end
