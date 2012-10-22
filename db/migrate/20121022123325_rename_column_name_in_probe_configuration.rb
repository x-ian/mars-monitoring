class RenameColumnNameInProbeConfiguration < ActiveRecord::Migration
  def change
    add_column :probe_configurations, :name, :string
    remove_column :probe_configurations, :ane
  end
end
