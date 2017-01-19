class ChangeDatatypeForMessageValuesAgain < ActiveRecord::Migration
  def up
    change_table :messages do |t|
      t.change :value1, :decimal, precision: 10, scale: 2
      t.change :value2, :decimal, precision: 10, scale: 2
      t.change :value3, :decimal, precision: 10, scale: 2
      t.change :value4, :decimal, precision: 10, scale: 2
    end
  end

  def down
    change_table :messages do |t|
      t.change :value1, :decimal
      t.change :value2, :decimal
      t.change :value3, :decimal
      t.change :value4, :decimal
    end
  end
end
