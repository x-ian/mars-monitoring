class CreateProbes < ActiveRecord::Migration
  def change
    create_table :probes do |t|
      t.string :name

      t.timestamps
    end
  end
end
