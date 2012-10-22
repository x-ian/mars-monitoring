class CreateProbeStatuses < ActiveRecord::Migration
  def change
    create_table :probe_statuses do |t|
      t.string :name
      t.string :status
      t.boolean :assumed

      t.timestamps
    end
  end
end
