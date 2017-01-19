class ChangeDatatypeForMessageValues < ActiveRecord::Migration
  def up
    change_table :messages do |t|
      t.change :value1, :decimal
      t.change :value2, :decimal
      t.change :value3, :decimal
      t.change :value4, :decimal
    end
  end

  def down
    change_table :messages do |t|
      t.change :value1, :integer
      t.change :value2, :integer
      t.change :value3, :integer
      t.change :value4, :integer
    end
  end
end
