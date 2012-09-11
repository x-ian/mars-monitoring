class AddEnabledToProbes < ActiveRecord::Migration
  def change
    add_column :probes, :enabled, :boolean
  end
end
