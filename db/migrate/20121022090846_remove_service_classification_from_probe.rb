class RemoveServiceClassificationFromProbe < ActiveRecord::Migration
  def up
    remove_column :probes, :service_classification_id
  end

  def down
    add_column :probes, :service_classification_id, :integer
  end
end
