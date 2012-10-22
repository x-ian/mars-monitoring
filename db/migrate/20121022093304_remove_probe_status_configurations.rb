class RemoveProbeStatusConfigurations < ActiveRecord::Migration
  def up
    drop_table :probe_status_configurations
  end

  def down
    create_table :probe_status_configurations do |t|
      t.integer :probe_id
      t.integer :user_id
      t.string :probe_status_template_id
      t.string :rule_ok
      t.string :rule_warning
      t.string :rule_error
      t.boolean :assumed

      t.timestamps
    end
  end
end
