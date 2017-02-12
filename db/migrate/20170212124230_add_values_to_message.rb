class AddValuesToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :value5, :decimal, precision: 10, scale: 2
    add_column :messages, :value6, :decimal, precision: 10, scale: 2
    add_column :messages, :value7, :decimal, precision: 10, scale: 2
    add_column :messages, :value8, :decimal, precision: 10, scale: 2
    add_column :messages, :value9, :decimal, precision: 10, scale: 2
    add_column :messages, :value10, :decimal, precision: 10, scale: 2
    add_column :messages, :value11, :decimal, precision: 10, scale: 2
    add_column :messages, :value12, :decimal, precision: 10, scale: 2
    add_column :messages, :value13, :decimal, precision: 10, scale: 2
    add_column :messages, :value14, :decimal, precision: 10, scale: 2
    add_column :messages, :value15, :decimal, precision: 10, scale: 2
    add_column :messages, :value16, :decimal, precision: 10, scale: 2
  end
end
