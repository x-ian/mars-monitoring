class RemoveColumnsFromProbeStatusConfiguration < ActiveRecord::Migration
  def up
    remove_column :probe_status_configurations, :probe_id
    remove_column :probe_status_configurations, :probe_status_template_id
    remove_column :probe_status_configurations, :user_id
  end

  def down
    add_column :probe_status_configurations, :user_id, :string
    add_column :probe_status_configurations, :probe_status_template_id, :string
    add_column :probe_status_configurations, :probe_id, :string
  end
end
