class AddCumulativeToValueTypes < ActiveRecord::Migration
  def change
    add_column :value_types, :cumulative, :boolean
  end
end
