class CreateValueTypes < ActiveRecord::Migration
  def change
    create_table :value_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
