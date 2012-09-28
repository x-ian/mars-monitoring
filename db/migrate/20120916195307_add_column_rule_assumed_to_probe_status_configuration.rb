class AddColumnRuleAssumedToProbeStatusConfiguration < ActiveRecord::Migration
  def change
    add_column :probe_status_configurations, :rule_assumed, :boolean
  end
end
