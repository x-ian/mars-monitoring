class AddProbeEnabledToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :probe_enabled, :boolean
  end
end
