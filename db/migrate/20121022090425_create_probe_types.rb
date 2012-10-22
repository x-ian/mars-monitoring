class CreateProbeTypes < ActiveRecord::Migration
  def change
    create_table :probe_types do |t|
      t.string :name
      t.text :description
      t.integer :communication_channel_id

      t.timestamps
    end
  end
end
