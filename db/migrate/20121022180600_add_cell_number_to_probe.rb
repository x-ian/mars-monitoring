class AddCellNumberToProbe < ActiveRecord::Migration
  def change
    add_column :probes, :cell_number, :string
  end
end
