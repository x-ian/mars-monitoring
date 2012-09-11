class AddColumnsToProbes < ActiveRecord::Migration
  def change
    add_column :probes, :customer_id, :integer
    add_column :probes, :location_id, :integer
    add_column :probes, :location_coordinates, :string
    add_column :probes, :service_classification_id, :integer
  end
end
